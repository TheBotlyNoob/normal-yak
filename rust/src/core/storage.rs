use gluesql::{
    core::{ast::ColumnDef, data::Schema},
    prelude::Glue,
};
use gluesql_encryption::EncryptedStore;
use rand::{RngCore, SeedableRng};
use rand_chacha::ChaCha20Rng;
use ring::aead::{NonceSequence, UnboundKey};

pub struct RandNonce(ChaCha20Rng);
impl RandNonce {
    #[must_use]
    pub fn new() -> Self {
        let rng = ChaCha20Rng::from_os_rng();
        Self(rng)
    }
}
impl Default for RandNonce {
    fn default() -> Self {
        Self::new()
    }
}

impl NonceSequence for RandNonce {
    fn advance(&mut self) -> Result<ring::aead::Nonce, ring::error::Unspecified> {
        let mut nonce = [0; 12];
        self.0.fill_bytes(&mut nonce);
        Ok(ring::aead::Nonce::assume_unique_for_key(nonce))
    }
}

// #[cfg(target_arch = "wasm32")]
// mod storage {
//     pub type Storage = gluesql_idb_storage::IdbStorage;
//     pub fn new_storage() -> Storage {
//         Storage::new("matrix").unwrap()
//     }
// }
// #[cfg(not(target_arch = "wasm32"))]
// mod storage {
//     pub type Storage = gluesql_sled_storage::SledStorage;
//     pub fn new_storage() -> Storage {
//         Storage::new("matrix").unwrap()
//     }
// }

mod specific {
    pub type Storage = gluesql_memory_storage::MemoryStorage;
    #[must_use]
    pub fn get_or_create() -> Storage {
        Storage::default()
    }
}

pub use specific::Storage;

pub async fn get(
    pin: [u8; 32],
) -> Result<Glue<EncryptedStore<Storage, RandNonce>>, crate::api::matrix::Error> {
    use gluesql::core::ast_builder::*;
    let mut db = Glue::new(
        EncryptedStore::new(
            specific::get_or_create(),
            UnboundKey::new(&ring::aead::AES_256_GCM, &pin).unwrap(),
            RandNonce::default(),
        )
        .await?,
    );

    table("matrix")
        .create_table_if_not_exists()
        .add_column("homeserver TEXT")
        .add_column("session MAP")
        .execute(&mut db)
        .await?;

    Ok(db)
}
