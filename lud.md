# tips

## about coroutine

resume 和 yield 的配合强大之处在于，resume 处于主线程中，它将外部状态（数据）传入到协同程序内部；而 yield 则将内部的状态（数据）返回到主线程中。

## code review

有时候啊 vim 中 `?` 可能没法完全展示 function 的注释文档，此时可以 删掉 .luarc 试试
