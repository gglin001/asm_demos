# toolchain env

## docker container(prefer and most tested)

https://github.com/gglin001/Dockerfiles/tree/master/qemu
https://github.com/gglin001/Dockerfiles/tree/master/riscv

```bash
# /opt/riscv is riscv toolchain, llvm + newlib

# `/opt/riscv` is riscv toolchain with llvm built
ln -sf /opt/riscv $PWD/toolchain/llvm

# `/opt/riscv` is riscv toolchain
ln -sf /opt/riscv $PWD/toolchain/riscv-gnu-toolchain
```

## macos with homebrew

```bash
# https://github.com/riscv-software-src/homebrew-riscv
brew tap riscv-software-src/riscv
brew install riscv-tools

# https://formulae.brew.sh/formula/llvm
brew install llvm
```

symbol link

```bash
# llvm
ln -sf /opt/homebrew/opt/llvm $PWD/toolchain/llvm

# riscv-gnu-toolchain
ln -sf /opt/homebrew/opt/riscv-gnu-toolchain $PWD/toolchain/riscv-gnu-toolchain
```

## download toolchain from embecosm

https://www.embecosm.com/resources/tool-chain-downloads/

TODO
