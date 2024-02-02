# 使用Protobuf
- 安装`protobufjs-cli` 安装命令：`npm install protobufjs-cli [--save --save-prefix=~]`
- 安装`protobufjs` 安装命令：`npm i -g protobufjs`
- 生成js文件 命令：`pbjs -t static_module -w commonjs -o msg.js msg.proto`
- js生成ts文件 命令：`pbts -o msg.d.ts msg.js`