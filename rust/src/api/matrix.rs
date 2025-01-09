use bitflags::bitflags;
use flutter_rust_bridge::frb;
pub use matrix_sdk::Client;
use matrix_sdk::{reqwest, ruma};
pub use reqwest::Url as RustUrl;
pub use ruma::api::client::session::get_login_types::v3::LoginType as RumaLoginType;
use thiserror::Error;

#[derive(Debug, Error)]
pub enum Error {
    #[error("error creating matrix client")]
    ClientBuildError(#[from] matrix_sdk::ClientBuildError),
    #[error("matrix http error")]
    HttpError(#[from] matrix_sdk::HttpError),
}

#[derive(Clone)]
pub struct MatrixClient {
    client: Client,
}
unsafe impl Send for MatrixClient {}
unsafe impl Sync for MatrixClient {}

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
    pub async fn new(homeserver: RustUrl) -> Result<Self, Error> {
        let client = Client::new(homeserver).await?;
        Ok(Self { client })
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
