use rand::{RngCore, SeedableRng};
use rand_chacha::ChaCha20Rng;
use ring::aead::NonceSequence;

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

pub use specific::{get_or_create, Storage};
