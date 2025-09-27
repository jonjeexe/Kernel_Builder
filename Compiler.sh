#!/system/bin/sh
clear
echo "- Date : $(date)"
echo "   ____ ___  __  __ ____  _     _     _____ ____  "
echo "  / ___/ _ \|  \/  |  _ \| |   | |   | ____|  _ \ "
echo " | |  | | | | |\/| | |_) | |   | |   |  _| | |_) |"
echo " | |__| |_| | |  | |  __/| |___| |___| |___|  _ < "
echo "  \____\___/|_|  |_|_|   |_____|_____|_____|_| \_\ "
echo "                   by @Jonjeexe                   "
echo ""
echo "##################################"
echo "## CLEANING BUILDING KERNEL SOURCE" 
echo "##################################"
echo ""
echo "# SET ENVIRONMENT VARIABLES"
export KBUILD_BUILD_USER="NAME USER"
export KBUILD_BUILD_HOST="NAME HOST"
export ARCH=arm64
export CC="ccache clang"
export CLANG_TRIPLE=aarch64-linux-gnu-
export CROSS_COMPILE=${CLANG_TRIPLE}
export CROSS_COMPILE_ARM32=arm-linux-gnueabi-
echo ""
echo "# CREATING OUTPUT DIRECTORY"
sudo mkdir -p out
sleep 1
echo ""
echo "# GENETATOR .CONFIG FILE MY KERNEL"
sudo make O=out ARCH=$ARCH CC="$CC" codename_defconfig
echo ""
echo "# START KERMEL COMPILING "
sudo make -j$(nproc) O=out ARCH=$ARCH CC="$CC" \
  CROSS_COMPILE=${CROSS_COMPILE} \
  CROSS_COMPILE_ARM32=${CROSS_COMPILE_ARM32} \
  AR=llvm-ar NM=llvm-nm OBJCOPY=llvm-objcopy \
  OBJDUMP=llvm-objdump STRIP=llvm-strip \
  LD=ld.lld LLVM_IAS=1
