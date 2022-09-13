## coroutine

resume 和 yield 的配合强大之处在于，resume 处于主线程中，它将外部状态（数据）传入到协同程序内部；而 yield 则将内部的状态（数据）返回到主线程中。

