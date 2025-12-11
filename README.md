# 💻 Provisioning

## Mac

```bash
./provisioning/macosx/install.sh
```

### 🛡️ GPG / SSH Keys

This repository does **not** store any GPG keys.
Those must be imported from offline storage.

#### GPG Keys on Smartcards (YubiKey)

When setting up a new machine, **import public key first**.
Only *after* the (thrusted) public key is known to local GPG keyring will:

```bash
gpg --card-status
```

successfully detect and associate the on-card subkeys.

---

#### Import the trusted public key

Import your public key:

```bash
gpg --import path/to/public.key
```

Or fetch from a keyserver:

```bash
gpg --recv-keys <YOUR_KEYID>
```

Then trust it:

```bash
gpg --edit-key <YOUR_KEYID>
trust
# Choose: 5 = ultimately trust
save
```

---

#### 2. Then import key stubs `gpg --card-status`

Once the public key is imported and trusted, run:

```bash
gpg --card-status
```

GPG will now:

* detect the signing, encryption, and authentication subkeys on the YubiKey
* associate them with the public key in your keyring
* enable signing, encryption, Git commit signing, and SSH via `gpg-agent`

No private key is imported—everything stays on the YubiKey.

---

This is required, because if the public key isn't already in keyring:

* subkeys on the smartcard appear "unknown"
* GPG won’t link them
* signing or SSH operations fail

Importing (and trusting) the public key **before** `gpg --card-status` ensures everything works.
