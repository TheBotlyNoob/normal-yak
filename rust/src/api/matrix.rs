use core::error;

use bitflags::bitflags;
use flutter_rust_bridge::frb;
use gluesql::prelude::{Glue, Payload, Value};
use gluesql_encryption::EncryptedStore;
pub use matrix_sdk::Client;
use matrix_sdk::{authentication::matrix::MatrixAuth, reqwest, ruma, AuthSession};
pub use reqwest::Url as RustUrl;
use ring::aead::{UnboundKey, AES_256_GCM};
pub use ruma::api::client::session::get_login_types::v3::LoginType as RumaLoginType;
use thiserror::Error;

use crate::core::storage;

#[derive(Debug, Error)]
pub enum Error {
    #[error("error creating matrix client")]
    ClientBuildError(#[from] matrix_sdk::ClientBuildError),
    #[error("matrix error: {0}")]
    MatrixError(#[from] matrix_sdk::Error),
    #[error("matrix http error")]
    HttpError(#[from] matrix_sdk::HttpError),
    #[error("invalid pin size")]
    InvalidPinSize,
    #[error("encryption error: {0}")]
    EncryptionError(#[from] gluesql_encryption::Error),
    #[error("storage error: {0}")]
    StorageError(#[from] gluesql::core::error::Error),
    #[error("no session found")]
    NoSession,
    #[error("url parse error")]
    UrlParseError(#[from] url::ParseError),
    #[error("serde_transmute error: {0}")]
    SerdeError(#[from] serde_transmute::TransmuteError),
}

pub struct MatrixClient {
    client: Client,
    db: Glue<EncryptedStore<storage::Storage, storage::RandNonce>>,
}

#[derive(Debug, Clone, Copy)]
pub struct InnerLoginTypes(pub u8);

bitflags! {
   impl InnerLoginTypes: u8 {
        const PASSWORD = 0b0000_0001;
        const TOKEN = 0b0000_0010;
        const SSO = 0b0000_0100;
        const APPLICATION_SERVICE = 0b0000_1000;

        const UNKNOWN = 0b1000_0000;
    }
}

impl InnerLoginTypes {
    #[frb(sync)]
    pub fn has_password(&self) -> bool {
        self.contains(Self::PASSWORD)
    }
    #[frb(sync)]
    pub fn has_token(&self) -> bool {
        self.contains(Self::TOKEN)
    }
    #[frb(sync)]
    pub fn has_sso(&self) -> bool {
        self.contains(Self::SSO)
    }
    #[frb(sync)]
    pub fn has_application_service(&self) -> bool {
        self.contains(Self::APPLICATION_SERVICE)
    }
    #[frb(sync)]
    pub fn has_unknown(&self) -> bool {
        self.contains(Self::UNKNOWN)
    }
}
#[derive(Debug, Clone)]
pub struct LoginTypes {
    pub real: Vec<RumaLoginType>,
    pub inner: InnerLoginTypes,
}

impl MatrixClient {
    pub async fn new(homeserver: RustUrl, pin: &[u8]) -> Result<Self, Error> {
        let client = Client::new(homeserver).await?;

        Ok(Self {
            client,
            db: storage::get(pin).await?,
        })
    }

    pub async fn get_session(pin: [u8; 32]) -> Result<Self, Error> {
        use gluesql::core::ast_builder::*;

        let mut db = storage::get(pin).await?;

        let payload = table("matrix").select().limit(1).execute(&mut db).await?;

        let Payload::Select { mut rows, labels } = payload else {
            todo!()
        };

        if let Some(row) = rows.pop() {
            let mut row = row.into_iter();

            let Value::Str(homeserver) = row.next().unwrap() else {
                todo!()
            };

            let Value::Map(session) = row.next().unwrap() else {
                todo!()
            };

            let session = AuthSession::Matrix(serde_transmute::transmute(
                session,
                &serde_transmute::Settings::default(),
            )?);

            let client = Client::new(RustUrl::parse(&homeserver)?).await?;

            client.restore_session(session).await?;

            Ok(Self { client, db })
        } else {
            Err(Error::NoSession)
        }
    }

    pub async fn login_types(&self) -> Result<LoginTypes, Error> {
        let login_types = self.client.matrix_auth().get_login_types().await?.flows;

        let mut inner = InnerLoginTypes::empty();
        for ty in &login_types {
            match ty {
                RumaLoginType::Password(_) => inner |= InnerLoginTypes::PASSWORD,
                RumaLoginType::Token(_) => inner |= InnerLoginTypes::TOKEN,
                RumaLoginType::Sso(_) => inner |= InnerLoginTypes::SSO,
                RumaLoginType::ApplicationService(_) => {
                    inner |= InnerLoginTypes::APPLICATION_SERVICE;
                }
                _ => inner |= InnerLoginTypes::UNKNOWN,
            }
        }

        Ok(LoginTypes {
            real: login_types,
            inner,
        })
    }
}
