### Kernel Builder
- This Script help to compile kernel Source using clang.

<br>

### Install required packages

```
sudo apt-get update -qq
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y -qq --no-install-recommends \
  git build-essential bc bison flex \
  libssl-dev libelf-dev zlib1g-dev \
  clang lld llvm gcc-aarch64-linux-gnu gcc-arm-linux-gnueabi \
  python3 python3-pip ninja-build zip ccache
sudo ln -sf /usr/bin/ld.lld /usr/bin/ld || true
```

<br>

### Download build.sh Script

```cmd
curl -O https://raw.githubusercontent.com/Jonjeexe/Kernel_Builder/refs/heads/script/build.sh
```

<br>

### Edit build.sh
1. edit KBUILD_BUILD_USER (optional)
2. edit KBUILD_BUILD_HOST (optional)

<br>

### Edit codename in Script 

change `<codename>_deconfig` to your own codename according to your device for example
`blossom_deconfig`

<br>

### Start Compiling 
- Run this cmd into your Kernel Source dir
```cmd
chmod +x build.sh && ./build.sh
```

