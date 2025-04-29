# tc-redirect-tap-builder 🛠️

Build and install the **tc-redirect-tap** CNI plugin *without* having Go on your host.
A tiny Docker build container does all the work and drops the final binary into
`/opt/cni/bin`.

---

## How to use

Clone this repository:

```
git clone https://github.com/spurin/tc-redirect-tap-builder.git
cd tc-redirect-tap-builder
```

Run the installer:

```
./install.sh
```

The script will:

- 🚀 **Build** a Docker image that compiles **tc-redirect-tap**
- 📦 **Extract** the `tc-redirect-tap` binary
- 🔧 **Install** it into **/opt/cni/bin**
- ✅ Leave you ready to chain the plugin in any CNI config!

---

## Requirements

- Docker running locally
- `sudo` privileges to write to **/opt/cni/bin**

---

## Notes

- By default the **latest** commit of the plugin is used.  
  To pin a specific tag or commit, change `@latest` in the `Dockerfile`.
- The final binary is built in a completely clean *scratch* image—no extra
  libraries on your host.
- Perfect companion for Firecracker / Kata / any project that needs the
  redirect-tap CNI plugin.

---

## License

MIT
