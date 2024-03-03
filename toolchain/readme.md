# toolchain env

### macos with homebrew

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

### docker container

TODO

### download toolchain from embecosm

https://www.embecosm.com/resources/tool-chain-downloads/

TODO
