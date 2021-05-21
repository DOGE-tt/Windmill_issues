{
{
"概述", 
{"img","https://ss2.bdstatic.com/6Ot1bjeh1BF3odCf/it/u=133317992,349185304&fm=74&app=80&f=PNG&size=f121,121?sec=1880279984&t=9b236660e4ac565b2dd29c527d5ac8fa"},
[[    Lua 是一种轻量小巧的脚本语言, 用标准C语言编写并以源代码形式开放,  其设计目的是为了嵌入应用程序中, 从而为应用程序提供灵活的扩展和定制功能。
    Lua 是巴西里约热内卢天主教大学（Pontifical Catholic University of Rio de Janeiro）里的一个研究小组于 1993 年开发的, 该小组成员有：Roberto Ierusalimschy、Waldemar Celes 和 Luiz Henrique de Figueiredo。]],
{"tip","该教程基于 Runoob 菜鸟教程（www.runoob.com/lua） 修改。并非所有代码都能运行, 仅作参考。"},
},
{
"语法",
{"n_code","注释",[=[单行注释
--注释内容

多行注释
--[[
    多行注释
    多行注释
]]

--[==[
    多行注释
    多行注释
]==]]=]},
"\t\t注释的内容不会被执行",
{"title","标志符"},
"\t\tLua 标示符用于定义一个变量, 函数获取其他用户定义的项。标示符以一个字母 A 到 Z 或 a 到 z 或下划线 _ 开头后加上0个或多个字母, 下划线, 数字（0到9）。\n\t\t最好不要使用下划线加大写字母的标示符, 因为Lua的保留字也是这样的。\n\t\tLua 不允许使用特殊字符如 @, $, 和 % 来定义标示符。\n\t\tLua 是一个区分大小写的编程语言, 因此在 Lua 中 develop 与 Develop 是两个不同的标示符。\n\t\t以下列出了一些正确的标示符：",
{"v_code","一些正确的标识符（变量名）",[[mohd         zara      abc     move_name    a_123
myname50     _temp     j       a23b9        retVal]]},
{"title","关键字"},
"\t\t以下是 Lua 的保留关键字, 保留关键字不能作为常量或变量或其他用户自定义标示符：",
{"v_code","Lua 保留关键字",[[and    break    do    else
elseif    end    false    for
function    if    in    local
nil    not    or    repeat
return    then    true    until
while    defer    switch    case]]},
"\t\t一般约定, 以下划线开头连接一串大写字母的名字（如 _VERSION）被保留用于 Lua 内部全局变量。",
{"title","变量"},
"\t\t在默认情况下, 变量总是认为是全局的。\n\t\t全局变量不需要声明, 给一个变量赋值后即创建了这个全局变量, 访问一个没有初始化的全局变量也不会出错, 不过只会得到nil。",
{"code","变量",[[print(b)--nil
b=10
print(b)--10]]},
"\t\t你可以通过在赋值时声明 local 来创建一个局部变量：",
{"v_code","局部变量","local b=10"},
"\t\t要注意的是局部变量在外部不能被访问, 也不能在创建此局部变量前定义的函数中被访问, 只会得到nil。\n\t\t如果你想删除一个变量, 只需要将变量赋值为nil。",
{"nc_code","删除变量",[[b=10
b=nil
print(b)--nil]]},
"\t\t这样变量b就好像从没被使用过一样。也就是说, 当一个变量不等于nil时, 这个变量即存在。",
},
{
"数据类型（1/2）",
"\t\tLua 是动态类型语言, 变量不需类型定义, 只需要为变量赋值。值可以存储在变量中, 作为参数传递或结果返回。\n\t\tLua 中有 8 个基本类型分别为：nil、boolean、number、string、userdata、function、thread 和 table。",
{"nc_code","数据类型",[==[nil
    只有值nil属于该类, 表示一个无效值（在条件表达式中相当于false）

boolean
    true 或 false

number
    表示双精度类型的实浮点数（如 12、3.5）

string
    字符串由一对双引号、单引号或[[]]来表示

function
    由 C 、Java 或 Lua 编写的函数

userdata
    表示任意存储在变量中的 C 数据结构

thread
    表示执行的独立线路, 用于执行协同程序

table
    储存数据的表]==]},
"\t\t我们可以使用 type 函数获取给定变量或者值的类型：",
{"code","",[[print(type("Hello world"))--string
print(type(10))--number
print(type(type))--function
print(type(true))--boolean
print(type(nil))--nil
print(type(type(nil)))--string]]},
{"title","nil（空值）"},
"\t\tnil 类型表示一种没有任何有效值, 它只有一个值 nil。例如打印一个没有赋值的变量, 便会输出一个 nil 值。\n\t\t把 nil 连接到其他值或调用 nil 时会出现错误。\n\t\t对于全局变量和 table, nil 还有删除作用, 给全局变量或者 table 表里的变量赋一个 nil 值, 等同于把它们删掉：",
{"code","删除 table 中的内容",[[local tab={key1="val1", key2="val2", "val3", "val4"}
for k, v in pairs(tab) do
    print(k, v)
end

--删除 key1
tab.key1 = nil
for k, v in pairs(tab) do
    print(k, v)
end

--适用于数字index
table.remove(tab,1)]]},
{"code","判断一个变量或值是否为 nil",[[local X

print(X==nil)--true

--使用 type
print(type(X)=="nil")--true]]},
{"title","boolean（布尔值）"},
"\t\tboolean 类型只有两个可选值：true（真）和 false（假）, Lua 把 false 和 nil 看作是“假”, 其他的都为“真”：",
{"code","boolean",[[print(type(true))--boolean
print(type(false))--boolean
 
if false or nil then
    print("至少有一个是 true")
else
    print("都为 false")
end--都为 false]]},
{"title","number（数字）"},
"\t\tLua 默认只有一种 number 类型 double（双精度）类型, 以下几种写法都被看作是 number 类型：",
{"v_code","number",[[2
2.2
2e+1]]},
{"code","比较大小",[[local number1=10
local number2=100

--小于
print(number1<number2)
--小于或等于
print(number1<=number2)
--大于
print(number1>number2)
--大于或等于
print(number1>=number2)
--等于
print(number1==number2)
--不等于
print(number1!=number2)]]},
{"tip","如果函数需要, 可以通过使用 int(number)、float(number)、short(number)、long(number)、double(number) 进行转换。"},
{"title","string（字符串）"},
"\t\t字符串由一对双引号或单引号来表示, 也可以用 2 个中括号 [[]] 来表示“一块”字符串：",
{"code","创建字符串",[==[local string1 = "I am a string!"
local string2 = 'I am also a string!'
local string3=[[我
是
字
符
串]]

--中括号的方式也可以这样使用, 注意前后等于号的数量要一致
local string4=[=[我
也
是
字
符
串]=]]==]},
{"code","算术操作",[[--在对一个数字字符串进行算术操作时, Lua 会尝试将这个数字字符串转成一个数字
print("2" + 6)--8.0
print("2" + "6")--8
print("-2e2" * "6")-1200.0
print("2 + 6")--2 + 6]]},
{"tip","注意在比较运算时, 需要使用 tonumber 手动将字符串转化成数字。"},
{"n_code","连接字符串",[[print("a" .. 'b')--ab
print(157 .. 428)--157428]]},
{"code","计算字符串长度",[[--使用 # 来计算字符串的长度, 放在字符串前面
local str="develop"

print(#str)--7
print(#"develop")--7]]},
},
{
"数据类型（2/2）",
{"title","table（表）"},
"\t\tLua 中 table 的创建是通过“构造表达式”来完成的, 最简单构造表达式是{}, 用来创建一个空表。也可以在表里添加一些数据, 直接初始化表：",
{"code","创建 table",[[-- 创建空 table
local tab1 = {}
 
-- 直接初始表
local tab2 = {"apple", "pear", "orange", "grape"}]]},
"\t\tLua 中的表（table）其实是一个“关联数组”（associative arrays）, 数组的索引可以是数字或者是字符串。",
{"code","定义 table 中的值",[[local tab={}
tab["key"] = "value"
local key = 10
tab[key] = 22
tab[key] = tab[key] + 11
for k, v in pairs(tab) do
    print(k, v)
end]]},
"\t\t不同于其他语言的数组把 0 作为数组的初始索引, 在 Lua 里表的默认初始索引一般以 1 开始。当然, 你也可以手动设置键值为0：",
{"code","索引",[[local tabl = {"apple", "pear", "orange", "grape"}
for k, v in pairs(tabl) do
    print(k, v)
end

local tab2 = {[0]="apple", "pear", "orange", "grape"}
for k, v in pairs(tab2) do
    print(k, v)
end]]},
"\t\ttable 不会固定长度大小, 有新数据添加时 table 长度会自动增长, 没初始的 table 中的值都是 nil：",
{"code","",[[local a3 = {}
print(#a3)--0
for i = 1, 10 do
    a3[i] = i
end
print(#a3)--10
a3["key"] = "val"
print(a3["key"])--val
print(a3["none"])--nil]]},
{"title","function（函数）"},
"\t\tLua 中函数被看作是“第一类值（First-Class Value）”, 函数可以存在变量里：",
{"code","定义并调用函数",[[local function factorial1(n)
    if n == 0 then
        return 1
    else
        return n * factorial1(n - 1)
    end
end
print(factorial1(5))--120
local factorial2 = factorial1
print(factorial2(5))--120
]]},
"\t\t可以以匿名函数（anonymous function）的方式通过参数传递：",
{"code","以参数传递函数",[[local function testFun(tab,fun)
    for k ,v in pairs(tab) do
        print(fun(k,v))
    end
end

local tab={key1="val1",key2="val2"}
testFun(tab,function(key,val)--匿名函数
    return key.."="..val;
end)]]},
{"title","thread（线程）"},
"\t\t在 Lua 里, 最主要的线程是协同程序（coroutine）。它跟线程（thread）差不多, 拥有自己独立的栈、局部变量和指令指针, 可以跟其他协同程序共享全局变量和其他大部分东西。\n\t\t线程跟协程的区别：线程可以同时多个运行, 而协程任意时刻只能运行一个, 并且处于运行状态的协程只有被挂起（suspend）时才会暂停。",
{"title","userdata（自定义类型）"},
"\t\tuserdata 是一种用户自定义数据, 用于表示一种由应用程序或 C/C++ 语言库所创建的类型, 可以将任意 C/C++ 的任意数据类型的数据（通常是 struct 和 指针）存储到 Lua 变量中调用。",
},
{
"变量",
"\t\t变量在使用前, 必须在代码中进行声明, 即创建该变量。变量有三种类型：全局变量、局部变量、表中的域。\n\t\tLua 中的变量全是全局变量, 那怕是语句块或是函数里, 除非用 local 显式声明为局部变量。局部变量的作用域为从声明位置开始到所在语句块结束。\n\t\t变量的默认值均为 nil。",
{"code","赋值变量",[[a = 5--全局变量
local b = 5-- 局部变量

function joke()--全局函数
    c = 5--全局变量
    local d = 6--局部变量
end

joke()
print(c,d)--5 nil

do
    local a = 6--局部变量
    b = 6--对局部变量重新赋值
    print(a,b)--6 6
end

print(a,b)--5 6]]},
{"title","赋值语句"},
"\t\t赋值是改变一个变量的值和改变表域的最基本的方法。\n\t\tLua 可以对多个变量同时赋值, 变量列表和值列表的各个元素用逗号分开, 赋值语句右边的值会依次赋给左边的变量。",
{"n_code","多重赋值","a, b = 10, 2*x--等同于 a=10; b=2*x"},
"\t\t遇到赋值语句Lua会先计算右边所有的值然后再执行赋值操作, 所以我们可以这样进行交换变量的值：",
{"n_code","交换变量","x, y = y, x-- swap 'x' for 'y'"},
"    当变量个数和值的个数不一致时, Lua会一直以变量个数为基础采取以下策略：",
{"v_code","",[[a. 变量个数 > 值的个数     按变量个数补足nil
b. 变量个数 < 值的个数   多余的值会被忽略]]},
{"code","多重赋值",[[a, b, c = 0, 1
print(a,b,c)-- 0   1   nil
 
a, b = a+1, b+1, b+2-- b+2 被忽略
print(a,b)-- 1   2
 
a, b, c = 0
print(a,b,c)-- 0   nil   nil

a, b, c = 0, 0, 0
print(a,b,c)-- 0   0   0]]},
{"tip","对多个变量赋值必须依次对每个变量赋值"},
"\t\t多值赋值经常用来交换变量, 或将函数调用返回给变量：",
{"v_code","","a, b = f()"},
"应该尽可能的使用局部变量, 有两个好处：\n\t\t1.避免命名冲突\n\t\t2.访问局部变量的速度比全局变量更快。",
{"tip","可以通过 local XXX 的方式提前声明变量。"},
{"title","索引"},
"\t\t对 table 的索引使用中括号 []。Lua 也提供了 . 操作。",
{"code","[] 和 .",[[local site={"lua 5.3"}

site["key"]="lua.org"
site.name="Lua Language"

print(site[1])--lua 5.3

print(site.key)--lua.org
print(site["name"])--Lua Language
-- . 操作是当索引为字符串类型时的一种简化写法]]},
},
{
"循环",
"\t\t很多情况下我们需要做一些有规律性的重复操作, 因此在程序中就需要重复执行某些语句。一组被重复执行的语句称之为循环体, 能否继续重复, 决定循环的终止条件。循环结构是在一定条件下反复执行某段程序的流程结构, 被反复执行的程序被称为循环体。\n\t\t循环语句是由循环体及循环的终止条件两部分组成的。",
{"img","https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1570982563005&di=cf223456903c822d8cb757c787fb5c61&imgtype=jpg&src=http%3A%2F%2Fimg1.imgtn.bdimg.com%2Fit%2Fu%3D1003277341%2C3047960525%26fm%3D214%26gp%3D0.jpg",256},
"Lua 语言提供了以下几种循环处理方式：",
{"nc_code","循环类型",[[while      在条件为 true 时, 让程序重复地执行某些语句。执行语句前会先检查条件是否为 true。
for     重复执行指定语句, 重复次数可在 for 语句中控制。
repeat...until      重复执行循环, 直到指定的条件为真时为止
循环嵌套        可以在循环内嵌套一个或多个循环语句（while do ... end;for ... do ... end;repeat ... until;）]]},
{"title","循环控制语句"},
{"nc_code","控制语句",[[break      退出当前循环或语句, 并开始脚本执行紧接着的语句。
continue      跳过此次循环开始下一次循环]]},
{"title","无限循环"},
"\t\t在循环体中如果条件永远为 true 循环语句就会永远执行下去, 以下以 while 循环为例：",
{"v_code","控制语句",[[while true do
   print("循环将永远执行下去")
end]]},
{"tip","不正确使用 while 循环, 会导致程序假死, 以上就是一个反例。可以将循环事件放入 thread 中执行。"},
},
{
"流程控制",
"\t\tLua 编程语言流程控制语句通过程序设定一个或多个条件语句来设定。在条件为 true 时执行指定程序代码, 在条件为 false 时执行其他指定代码。\n\t\t以下是典型的流程控制流程图：",
{"img","https://www.yiibai.com/uploads/article/2018/12/06/150305_77801.jpg"},
"Lua 提供了以下控制结构语句：",
{"nc_code","语句",[[if              由一个布尔表达式作为条件判断, 其后紧跟其他语句组成。
if...else       if 语句 可以与 else 语句搭配使用, 在 if 条件表达式为 false 时执行 else 语句代码。
if...elseif     if 语句 可以与多个 elseif 语句搭配使用, 在 if 条件表达式为 false 时按顺序判断余下的 elseif 语句代码。
switch...case   switch 语句 可以与 case 语句搭配使用, 执行任意 case 条件成立的语句代码。
嵌套语句        你可以在if 或 else if中使用一个或多个 if 或 else if 语句 。]]},
},
{
"函数",
"\t\t在Lua中, 函数是对语句和表达式进行抽象的主要方法。既可以用来处理一些特殊的工作, 也可以用来计算一些值。Lua 提供了许多的内建函数, 你可以很方便的在程序中调用它们, 如print(...)函数可以将传入的参数打印在控制台上。\n\nLua 函数主要有两种用途：\n\t\t1.完成指定的任务, 这种情况下函数作为调用语句使用\n\t\t2.计算并返回值, 这种情况下函数作为赋值语句的表达式使用。",
{"title","函数定义"},
"\t\tLua 编程语言函数定义格式如下：",
{"v_code","",[[optional_function_scope function function_name( argument1, argument2, argument3..., argumentn)
    function_body
    return result_params_comma_separated
end]]},
[[optional_function_scope: 该参数是可选的, 用于指定函数是全局函数还是局部函数, 未设置则默认为全局函数, 如果你需要设置为局部函数需要使用关键字 local。

function_name: 指定函数名称。

argument1, argument2, argument3..., argumentn: 函数参数, 多个参数以逗号隔开, 不确定参数个数时可使用... , 也可以不带参数。

function_body: 函数体, 函数中需要执行的代码语句块。

result_params_comma_separated: 函数返回值。支持多个返回值, 每个值以逗号隔开。]],
{"title","实例"},
"\t\t以下实例定义了函数 max(), 参数为 num1, num2, 用于比较两值的大小, 并返回最大值：",
{"code","返回两个值的最大值",[[local function max(num1, num2)
    local result
    if (num1 > num2) then
      result = num1
     else
      result = num2
    end
    return result
end

print("两值比较最大值为",max(10,4))--10
print("两值比较最大值为",max(5,6))--6]]},
"\t\tLua 中我们可以将函数作为参数传递给函数, 如下实例：",
{"code","",[[local function myprint(param)
   print("这是打印函数 - ##",param,"##")
end

local function add(num1,num2,functionPrint)
   local result = num1 + num2
   functionPrint(result)-- 调用传递的函数参数
end

myprint(10)
add(2,5,myprint)-- myprint 函数作为参数传递]]},
{"title","多返回值"},
"\t\tLua函数可以返回多个结果值。如 string.find 返回匹配串开始和结束的下标（如果不存在则返回nil）。",
{"code","",[[local s, e=string.find("com.applua.pretend", "applua")
print(s, e)--5    10]]},
"\t\tLua函数中, 在return后列出要返回的值的列表即可返回多值, 如：",
{"code","",[[locl function maximum (a)
    local mi = 1-- 最大值索引
    local m = a[mi]-- 最大值
    for i,val in ipairs(a) do
       if val > m then
           mi = i
           m = val
       end
    end
    return m, mi
end

print(maximum({8,10,23,12,5}))--23    3]]},
{"title","可变参数"},
"\t\tLua 函数可以接受可变数目的参数, 和 C 语言类似, 在函数参数列表中使用三点 ... 表示函数有可变的参数。",
{"code","",[[local function add(...)  
local s = 0  
  for i, v in ipairs{...} do--{...} 表示一个由所有变长参数构成的数组  
    s = s + v  
  end  
  return s  
end  
print(add(3,4,5,6,7))--25]]},
"\t\t我们可以将可变参数赋值给一个变量。\n\t\t例如, 我们计算几个数的平均值：",
{"code","计算平均值",[[local function average(...)
   local result = 0
   local arg={...}--arg 为一个表, 局部变量
   for i,v in ipairs(arg) do
      result = result + v
   end
   print("总共传入 " .. #arg .. " 个数")
   return result/#arg
end

print("平均值为",average(10,5,3,4,5,6))--总共传入 6 个数, 平均值为    5.5]]},
'\t\t我们也可以通过 select("#",...) 来获取可变参数的数量:',
{"code","",[[local function average(...)
   local result = 0
   local arg={...}
   for i,v in ipairs(arg) do
      result = result + v
   end
   print("总共传入 " .. select("#",...) .. " 个数")
   return result/select("#",...)
end

print("平均值为",average(10,5,3,4,5,6))]]},
"\t\t有时候我们可能需要几个固定参数加上可变参数, 固定参数必须放在变长参数之前：",
{"code","",[[local function fwrite(fmt, ...)  -- 固定的参数fmt
    return io.write(string.format(fmt, ...))    
end

fwrite("androlua\n")       -- fmt = "androlua", 没有变长参数。  
fwrite("%d%d\n", 1, 2)   -- fmt = "%d%d", 变长参数为 1 和 2]]},
"\t\t通常在遍历变长参数的时候只需要使用 {…}, 然而变长参数可能会包含一些 nil, 那么就可以用 select 函数来访问变长参数了：select('#', …) 或者 select(n, …)\n\t\tselect('#', …) 返回可变参数的长度\n\t\tselect(n, …) 用于访问 n 到 select('#',…) 的参数\n\t\t调用select时, 必须传入一个固定实参selector(选择开关)和一系列变长参数。如果selector为数字n,那么select返回它的第n个可变实参, 否则只能为字符串'#',这样select会返回变长参数的总数。例子代码：",
{"code","",[[local function foo(...)  
        for i = 1, select('#', ...) do  --获取参数总数
            local arg = select(i, ...) --读取参数
            print("arg", arg) 
        end  
    end  
 
    foo(1, nil, 3, 4)]]},
},
{
"运算符",
[[      运算符是一个特殊的符号, 用于告诉解释器执行特定的数学或逻辑运算。Lua提供了以下几种运算符类型：

 · 算术运算符
 · 关系运算符
 · 逻辑运算符
 · 其他运算符]],
{"title","算术运算符"},
"\t\t下表列出了 Lua 语言中的常用算术运算符, 设定 A 的值为10, B 的值为 20：",
{"v_code","",[[+  加法        A + B 输出结果 30
-	减法        A - B 输出结果 -10
    负号        -A 输出结果 -10
*	乘法        A * B 输出结果 200
/	除法        B / A 输出结果 2
%	取余        B % A 输出结果 0
^	乘幂        A^2 输出结果 100]]},
"\t\t我们可以通过以下实例来更加透彻的理解算术运算符的应用：",
{"code","",[[local a = 21
local b = 10
local c = a + b
print("Line 1 - c 的值为 ", c )
c = a - b
print("Line 2 - c 的值为 ", c )
c = a * b
print("Line 3 - c 的值为 ", c )
c = a / b
print("Line 4 - c 的值为 ", c )
c = a % b
print("Line 5 - c 的值为 ", c )
c = a^2
print("Line 6 - c 的值为 ", c )
c = -a
print("Line 7 - c 的值为 ", c )]]},
{"title","关系运算符"},
{"v_code","",[[== 等于             检测两个值是否相等, 相等返回 true, 否则返回 false	(A == B) 为 false。
~= 或 !=  不等于    检测两个值是否相等, 相等返回 false, 否则返回 true	(A ~= B) 为 true。
>   大于            如果左边的值大于右边的值, 返回 true, 否则返回 false	(A > B) 为 false。
<   小于            如果左边的值大于右边的值, 返回 false, 否则返回 true	(A < B) 为 true。
>=  大于等于        如果左边的值大于等于右边的值, 返回 true, 否则返回 false	(A >= B) 返回 false。
<=  小于等于        如果左边的值小于等于右边的值, 返回 true, 否则返回 false	(A <= B) 返回 true。]]},
"\t\t我们可以通过以下实例来更加透彻的理解关系运算符的应用：",
{"code","",[[local a = 21
local b = 10

if a == b then
   print("Line 1 - a 等于 b" )
else
   print("Line 1 - a 不等于 b" )
end

if a ~= b then
   print("Line 2 - a 不等于 b" )
else
   print("Line 2 - a 等于 b" )
end

if a < b then
   print("Line 3 - a 小于 b" )
else
   print("Line 3 - a 大于等于 b" )
end

if a > b then
   print("Line 4 - a 大于 b" )
else
   print("Line 5 - a 小于等于 b" )
end

-- 修改 a 和 b 的值
local a = 5
local b = 20
if a <= b then
   print("Line 5 - a 小于等于  b" )
end

if b >= a then
   print("Line 6 - b 大于等于 a" )
end]]},
{"title","逻辑运算符"},
"下表列出了 Lua 语言中的常用逻辑运算符, 设定 A 的值为 true, B 的值为 false：",
{"v_code","",[[
and 或 &&       若 A 为 false, 则返回 A, 否则返回 B。	(A and B) 为 false。
or 或 ||        若 A 为 true, 则返回 A, 否则返回 B。	(A or B) 为 true。
not 或 !        逻辑运算结果相反, 如果条件为 true, 逻辑非为 false。	not(A and B) 为 true。]]},
"\t\t我们可以通过以下实例来更加透彻的理解逻辑运算符的应用：",
{"code","",[[local a = true
local b = true

if a and b then
   print("a and b - 条件为 true" )
end

if a or b then
   print("a or b - 条件为 true" )
end

-- 修改 a 和 b 的值
local a = false
local b = true
if a and b then
   print("a and b - 条件为 true" )
else
   print("a and b - 条件为 false" )
end

if not a and b then
   print("not( a and b) - 条件为 true" )
else
   print("not( a and b) - 条件为 false" )
end]]},
{"title","其他运算符"},
"\t\t下表列出了 Lua 语言中的连接运算符与计算表或字符串长度的运算符：",
{"v_code","",[[
..      连接两个字符串	a..b , 其中 a 为 "Hello " ,  b 为 "World", 输出结果为 "Hello World"。
#       一元运算符, 返回字符串或表的长度。	#"Hello" 返回 5]]},
{"title","运算符优先级"},
"\t\t下表内容从高到低的排序。你可以通过使用 () 来影响计算的优先级。",
{"v_code","",[[^
not    - (一元运算)
*      /
+      -
..
<      >      <=     >=     ~=     ==
and
or]]},
"\t\t除了 ^ 和 .. 外所有的二元运算符都是左连接的。",
{"n_code","",[[a+i < b/2+1          <-->       (a+i) < ((b/2)+1)
5+x^2*8              -->       5+((x^2)*8)
a < y and y <= z     -->       (a < y) and (y <= z)
-x^2                 -->       -(x^2)
x^y^z                -->       x^(y^z)]]},
"    我们可以通过以下实例来更加透彻的了解 Lua 语言运算符的优先级：",
{"code","",[[local a = 20
local b = 10
local c = 15
local d = 5

e = (a + b) * c / d;-- ( 30 * 15 ) / 5
print("(a + b) * c / d 运算值为  :",e )

e = ((a + b) * c) / d; -- (30 * 15 ) / 5
print("((a + b) * c) / d 运算值为 :",e )

e = (a + b) * (c / d);-- (30) * (15/5)
print("(a + b) * (c / d) 运算值为 :",e )

e = a + (b * c) / d;  -- 20 + (150/5)
print("a + (b * c) / d 运算值为   :",e )]]},
},
{
"字符串",
"\t\t字符串或串(String)是由数字、字母、下划线组成的一串字符。Lua 语言中字符串可以使用以下三种方式来表示：\n\n\t\t· 单引号间的一串字符。\n\t\t· 双引号间的一串字符。\n\t\t· [[和]]间的一串字符。\n\n\t\t以上三种方式的字符串实例如下：",
{"n_code","",[=[string1 = "Lua"
print("字符串 1 是",string1)

string2 = 'com.applua'
print("字符串 2 是",string2)

string3 = [[Lua 教程]]
print("字符串 3 是",string3)]=]},
'\t\t转义字符用于表示不能直接显示的字符, 比如后退键, 回车键, 等。如在字符串转换双引号可以使用 "\""。所有的转义字符和所对应的意义：',
{"v_code","",[[\a      响铃(BEL)
\b      退格(BS) , 将当前位置移到前一列
\f      换页(FF), 将当前位置移到下页开头
\n      换行(LF) , 将当前位置移到下一行开头
\r      回车(CR) , 将当前位置移到本行开头
\t      水平制表(HT) （跳到下一个TAB位置）
\v      垂直制表(VT)
\\      代表一个反斜线字符''\'
\'      代表一个单引号（撇号）字符
\"      代表一个双引号字符
\0      空字符(NULL)
\ddd    1到3位八进制数所代表的任意字符
\xhh    1到2位十六进制所代表的任意字符]]},
{"title","字符串操作"},
"\t\tLua 提供了很多的方法来支持字符串的操作：",
{"v_code","",[==[
string.upper(source)
    将 source 的内容全部转为大写字母。

string.lower(source)
    将 source 的内容全部转为小写字母。

string.gsub(source,find,replace,time)
    替换字符串的内容。
    source 目标字符串
    find 要查找的内容(支持正则匹配)
    replace 要替换成的内容
    time 替换的次数(可选, 默认替换所有匹配)

    return 完成替换的目标字符串

    用例:
    string.gsub("aaaa","a","z",3)--zzza    3
    --注意以下类型的替换请使用 java.lang.Strig 类进行操作
    --string.gsub("aaaa","a","aa",3)

string.find (source,find,[start,[end]])
    查找字符串内容。
    source 目标字符串
    find 要查找的内容(支持正则匹配)
    start 指定查找的起始位置
    end 指定查找的结束位置
    
    return 查找到的起始于结束位置, 如果未找到,返回 nil

    用例:
    string.find("Hello Lua user", "Lua", 1)--7    9
    string.find("Hello Lua user", "Android")--nil

string.reverse(source)
    字符串反转

    用例:
    string.reverse("Lua")--auL

string.format(source,...)
    类似printf的格式化字符串。
    source 目标字符串
    ... 格式化参数

    用例:
    string.format("the value is:%d",4)--the value is:4

string.char(...)
    整型数字转成字符并连接

    用例:
    string.char(97,98,99,100)--abcd

string.byte(source[,index])
    转换字符为整数值
    source 目标字符串
    index 转换的字符位置(可选, 默认为第一个字符)

    用例:
    string.byte("ABCD",4)--68
    string.byte("ABCD")--65

string.len(source)
    计算字符串长度。
    
    用例:
    string.len("abc")--3

string.rep(string,time)
    重复字符串内容
    source 目标字符串
    time 重复次数

    用例:
    string.rep("abcd",2)--abcdabcd

..
    连接两个字符串

    用例:
    print("lua.".."org")--lua.org

string.gmatch(source,pattern)
    查字符串中的指定内容的多次匹配。
    source 目标字符串
    pattern 正则表达式
    
    return 迭代器函数。每调用这个函数, 返回一个在字符串 str 找到的下一个符合 pattern 描述的子串。如果没有找到, 迭代函数返回nil。
    
    用例:
    for word in string.gmatch("Hello Lua user", "%a+") do 
        print(word) 
    end--Hello, Lua, user

string.match(source,pattern[,start])
    查字符串中的指定内容的第一个匹配。
    source 目标字符串
    pattern 正则表达式
    start 查找的起始位置(可选, 默认为默认为第一个字符)
    
    return 成功配对时返回配对表达式中的所有捕获结果, 如果没有成功配对, 返回nil。

    用例:
    string.match("I have 2 questions for you.", "%d+ %a+")--2 questions]==]},
{"code","大小写转换",[[string1 = "Lua";
print(string.upper(string1))--LUA
print(string.lower(string1))--lua]]},
{"code","查找与反转",[[string = "Lua Tutorial"
-- 查找字符串
print(string.find(string,"Tutorial"))--5    12
reversedString = string.reverse(string)
print("新字符串为",reversedString)--lairotuT auL]]},
{"title","字符串格式化"},
"\t\tLua 提供了 string.format() 函数来生成具有特定格式的字符串, 函数的第一个参数是格式 , 之后是对应格式中每个代号的各种数据。由于格式字符串的存在, 使得产生的长字符串可读性大大提高了。这个函数的格式很像 C 语言中的 printf()。\n\t\t格式字符串可能包含以下的转义码:",
{"v_code","",[[%c - 接受一个数字, 并将其转化为ASCII码表中对应的字符
%d, %i - 接受一个数字并将其转化为有符号的整数格式
%o - 接受一个数字并将其转化为八进制数格式
%u - 接受一个数字并将其转化为无符号整数格式
%x - 接受一个数字并将其转化为十六进制数格式, 使用小写字母
%X - 接受一个数字并将其转化为十六进制数格式, 使用大写字母
%e - 接受一个数字并将其转化为科学记数法格式, 使用小写字母e
%E - 接受一个数字并将其转化为科学记数法格式, 使用大写字母E
%f - 接受一个数字并将其转化为浮点数格式
%g(%G) - 接受一个数字并将其转化为%e(%E, 对应%G)及%f中较短的一种格式
%q - 接受一个字符串并将其转化为可安全被Lua编译器读入的格式
%s - 接受一个字符串并按照给定的参数格式化该字符串

为进一步细化格式, 可以在%号后添加参数. 参数将以如下的顺序读入:

    (1) 符号: 一个+号表示其后的数字转义符将让正数显示正号. 默认情况下只有负数显示符号.
    (2) 占位符: 一个0, 在后面指定了字串宽度时占位用. 不填时的默认占位符是空格.
    (3) 对齐标识: 在指定了字串宽度时, 默认为右对齐, 增加-号可以改为左对齐.
    (4) 宽度数值
    (5) 小数位数/字串裁切: 在宽度数值后增加的小数部分n, 若后接f(浮点数转义符, 如%6.3f)则设定该浮点数的小数只保留n位, 若后接s(字符串转义符, 如%5.3s)则设定该字符串只显示前n位.]]},
{"code","格式化操作",[[string1 = "Lua"
string2 = "Tutorial"
number1 = 10
number2 = 20
-- 基本字符串格式化
print(string.format("基本格式化 %s %s",string1,string2))
-- 日期格式化
date = 2; month = 1; year = 2014
print(string.format("日期格式化 %02d/%02d/%03d", date, month, year))
-- 十进制格式化
print(string.format("%.4f",1/3))]]},
{"title","字符与整数相互转换"},
{"code","",[[-- 字符转换
-- 转换第一个字符
print(string.byte("Lua"))
-- 转换第三个字符
print(string.byte("Lua",3))
-- 转换末尾第一个字符
print(string.byte("Lua",-1))
-- 第二个字符
print(string.byte("Lua",2))
-- 转换末尾第二个字符
print(string.byte("Lua",-2))

-- 整数 ASCII 码转换为字符
print(string.char(97))]]},
{"title","匹配模式"},
"\t\tLua 中的匹配模式直接用常规的字符串来描述。 它用于模式匹配函数 string.find, string.gmatch, string.gsub, string.match。\n\t\t你还可以在模式串中使用字符类。字符类指可以匹配一个特定字符集合内任何字符的模式项。比如, 字符类 %d 匹配任意数字。所以你可以使用模式串 %d%d/%d%d/%d%d%d%d 搜索 dd/mm/yyyy 格式的日期：",
{"code","",[[local s = "Deadline is 30/05/1999, firm"
local date = "%d%d/%d%d/%d%d%d%d"
print(string.sub(s, string.find(s, date)))    --> 30/05/1999]]},
"\t\t下面的表列出了Lua支持的所有字符类：\n\t\t单个字符(除 ^$()%.[]*+-? 外): 与该字符自身配对",
{"v_code","",[[.(点)  与任何字符配对
%a  与任何字母配对
%c  与任何控制符配对(例如\n)
%d  与任何数字配对
%l  与任何小写字母配对
%p  与任何标点(punctuation)配对
%s  与空白字符配对
%u  与任何大写字母配对
%w  与任何字母/数字配对
%x  与任何十六进制数配对
%z  与任何代表0的字符配对
%x(此处x是非字母非数字字符) 与字符x配对. 主要用来处理表达式中有功能的字符(^$()%.[]*+-?)的配对问题, 例如%%与%配对
[数个字符类]    与任何[]中包含的字符类配对. 例如[%w_]与任何字母/数字, 或下划线符号(_)配对
[^数个字符类]   与任何不包含在[]中的字符类配对. 例如[^%s]与任何非空白字符配对]]},
"\t\t当上述的字符类用大写书写时, 表示与非此字符类的任何字符配对. 例如, %S表示与任何非空白字符配对.例如, '%A'非字母的字符:",
{"code","",[[print(string.gsub("hello, up-down!", "%A", "."))--hello..up.down.    4]]},
"\t\t在模式匹配中有一些特殊字符, 他们有特殊的意义, Lua中的特殊字符如下：",
{"n_code","","( ) . % + - * ? [ ^ $"},
"\t\t'%' 用作特殊字符的转义字符, 因此 '%.' 匹配点(.)；'%%' 匹配字符 '%'。转义字符 '%'不仅可以用来转义特殊字符, 还可以用于所有的非字母的字符。",
[[模式条目可以是：

    单个字符类匹配该类别中任意单个字符；
    单个字符类跟一个 '*',  将匹配零或多个该类的字符。 这个条目总是匹配尽可能长的串；
    单个字符类跟一个 '+',  将匹配一或更多个该类的字符。 这个条目总是匹配尽可能长的串；
    单个字符类跟一个 '-',  将匹配零或更多个该类的字符。 和 '*' 不同,  这个条目总是匹配尽可能短的串；
    单个字符类跟一个 '?',  将匹配零或一个该类的字符。 只要有可能, 它会匹配一个；
    %n,  这里的 n 可以从 1 到 9； 这个条目匹配一个等于 n 号捕获物（后面有描述）的子串。
    %bxy,  这里的 x 和 y 是两个明确的字符； 这个条目匹配以 x 开始 y 结束,  且其中 x 和 y 保持 平衡 的字符串。 意思是, 如果从左到右读这个字符串, 对每次读到一个 x 就 +1 , 读到一个 y 就 -1,  最终结束处的那个 y 是第一个记数到 0 的 y。 举个例子, 条目 %b() 可以匹配到括号平衡的表达式。
    %f[set],  指 边境模式； 这个条目会匹配到一个位于 set 内某个字符之前的一个空串,  且这个位置的前一个字符不属于 set 。 集合 set 的含义如前面所述。 匹配出的那个空串之开始和结束点的计算就看成该处有个字符 '\0' 一样。]],
[[模式：

模式 指一个模式条目的序列。 在模式最前面加上符号 '^' 将锚定从字符串的开始处做匹配。 在模式最后面加上符号 '$' 将使匹配过程锚定到字符串的结尾。 如果 '^' 和 '$' 出现在其它位置, 它们均没有特殊含义, 只表示自身。]],
[[捕获：

模式可以在内部用小括号括起一个子模式； 这些子模式被称为 捕获物。 当匹配成功时, 由 捕获物 匹配到的字符串中的子串被保存起来用于未来的用途。 捕获物以它们左括号的次序来编号。 例如, 对于模式 "(a*(.)%w(%s*))" ,  字符串中匹配到 "a*(.)%w(%s*)" 的部分保存在第一个捕获物中 （因此是编号 1 ）； 由 "." 匹配到的字符是 2 号捕获物,  匹配到 "%s*" 的那部分是 3 号。

作为一个特例, 空的捕获 () 将捕获到当前字符串的位置（它是一个数字）。 例如, 如果将模式 "()aa()" 作用到字符串 "flaaap" 上, 将产生两个捕获物： 3 和 5 。]],
},
{
"数组",
"\t\t数组, 就是相同数据类型的元素按一定顺序排列的集合, 可以是一维数组和多维数组。Lua 数组的索引键值可以使用整数表示, 数组的大小不是固定的。",
{"title","一维数组"},
"\t\t一维数组是最简单的数组, 其逻辑结构是线性表。一维数组可以用for循环出数组中的元素, 如下实例：",
{"code","",[[array = {"Lua", "Tutorial"}

for i= 0, 2 do
   print(array[i])
end]]},
"\t\t正如你所看到的, 我们可以使用整数索引来访问数组元素, 如果知道的索引没有值则返回nil。\n    在 Lua 索引值是以 1 为起始, 但你也可以指定 0 开始。除此外我们还可以以负数为数组索引值：",
{"code","",[[array = {}

for i= -2, 2 do
   array[i] = i *2
end

for i = -2,2 do
   print(array[i])
end]]},
{"title","多维数组"},
"\t\t多维数组即数组中包含数组或一维数组的索引键对应一个数组。以下是一个三行三列的阵列多维数组：",
{"code","",[[-- 初始化数组
local array = {}

for i=1,3 do
   array[i] = {}
   for j=1,3 do
        array[i][j] = i*j
   end
end

-- 访问数组
for i=1,3 do
   for j=1,3 do
      print(array[i][j])
   end
end]]},
"\t\t不同索引键的三行三列阵列多维数组：",
{"code","",[[-- 初始化数组
lcoal array = {}
lcoal maxRows = 3
lcoal maxColumns = 3

for row=1,maxRows do
   for col=1,maxColumns do
      array[row*maxColumns +col] = row*col
   end
end

-- 访问数组
for row=1,maxRows do
   for col=1,maxColumns do
      print(array[row*maxColumns +col])
   end
end]]},
"\t\t以上的实例中, 数组设定了指定的索引值, 这样可以避免出现 nil 值, 有利于节省内存空间。",
},
{
"迭代器",
"\t\t迭代器（iterator）是一种对象, 它能够用来遍历标准模板库容器中的部分或全部元素, 每个迭代器对象代表容器中的确定的地址。在 Lua 中迭代器是一种支持指针类型的结构, 它可以遍历集合的每一个元素。",
{"title","泛型 for"},
"\t\t泛型 for 在自己内部保存迭代函数, 实际上它保存三个值：迭代函数、状态常量、控制变量。泛型 for 迭代器提供了集合的 key/value 对, 语法格式如下：",
{"v_code","",[[for k, v in pairs(t) do
    print(k, v)
end]]},
"\t\t上面代码中, k 为索引名, v 为值内容, pairs(t)为表达式列表。查看以下实例:",
{"code","",[[local array = {"Lua", "Applua"}

for key,value in ipairs(array) do
   print(key, value)
end]]},
[[以上实例中我们使用了 Lua 默认提供的迭代函数 ipairs。
下面我们看看泛型 for 的执行过程：

    首先, 初始化, 计算 in 后面表达式的值, 表达式应该返回泛型 for 需要的三个值：迭代函数、状态常量、控制变量；与多值赋值一样, 如果表达式返回的结果个数不足三个会自动用 nil 补足, 多出部分会被忽略。
    第二, 将状态常量和控制变量作为参数调用迭代函数（注意：对于 for 结构来说, 状态常量没有用处, 仅仅在初始化时获取他的值并传递给迭代函数）。
    第三, 将迭代函数返回的值赋给变量列表。
    第四, 如果返回的第一个值为nil循环结束, 否则执行循环体。
    第五, 回到第二步再次调用迭代函数

在Lua中我们常常使用函数来描述迭代器, 每次调用该函数就返回集合的下一个元素。Lua 的迭代器包含以下两种类型：

    无状态的迭代器
    多状态的迭代器]],
{"title","无状态的迭代器"},
"\t\t无状态的迭代器是指不保留任何状态的迭代器, 因此在循环中我们可以利用无状态迭代器避免创建闭包花费额外的代价。每一次迭代, 迭代函数都是用两个变量（状态常量和控制变量）的值作为参数被调用, 一个无状态的迭代器只利用这两个值可以获取下一个元素。\n\t\t这种无状态迭代器的典型的简单的例子是 ipairs, 它遍历数组的每一个元素。\n    以下实例我们使用了一个简单的函数来实现迭代器, 实现数字 n 的平方：",
{"code","",[[local function square(iteratorMaxCount,currentNumber)
   if currentNumber<iteratorMaxCount then
    currentNumber = currentNumber+1
    return currentNumber, currentNumber*currentNumber
   end
end

for i,n in square,3,0 do
   print(i,n)
end]]},
"\t\t迭代的状态包括被遍历的表（循环过程中不会改变的状态常量）和当前的索引下标（控制变量）, ipairs 和迭代函数都很简单, 我们在 Lua 中可以这样实现：",
{"code","",[[local function iter (a, i)
    i = i + 1
    local v = a[i]
    if v then
       return i, v
    end
end
 
local function ipairs (a)
    return iter, a, 0
end]]},
"\t\t当 Lua 调用 ipairs(a) 开始循环时, 他获取三个值：迭代函数 iter、状态常量 a、控制变量初始值 0；然后 Lua 调用 iter(a,0) 返回 1, a[1]（除非 a[1]=nil）；第二次迭代调用 iter(a,1) 返回 2, a[2]……直到第一个 nil 元素。",
{"title","多状态的迭代器"},
"\t\t很多情况下, 迭代器需要保存多个状态信息而不是简单的状态常量和控制变量, 最简单的方法是使用闭包, 还有一种方法就是将所有的状态信息封装到 table 内, 将 table 作为迭代器的状态常量, 因为这种情况下可以将所有的信息存放在 table 内, 所以迭代函数通常不需要第二个参数。\n\t\t以下实例我们创建了自己的迭代器：",
{"code","",[[local array = {"Android", "AppLua"}

lcoal function elementIterator (collection)
   local index = 0
   local count = #collection
   -- 闭包函数
   return function ()
      index = index + 1
      if index <= count then
         --  返回迭代器的当前元素
         return collection[index]
      end
   end
end

for element in elementIterator(array) do
   print(element)
end]]},
"\t\t以上实例中我们可以看到, elementIterator 内使用了闭包函数, 实现计算集合大小并输出各个元素。",
},
{
"table(表)",
[[    table 是 Lua 的一种数据结构用来帮助我们创建不同的数据类型, 如：数组、字典等。
    Lua table 使用关联型数组, 你可以用任意类型的值来作数组的索引, 但这个值不能是 nil。Lua table 是不固定大小的, 你可以根据自己需要进行扩容。
    Lua也是通过table来解决模块（module）、包（package）和对象（Object）的。 例如string.format表示使用"format"来索引table string。]],
{"title","table(表)的构造"},
"\t\t构造器是创建和初始化表的表达式。表是Lua特有的功能强大的东西。最简单的构造函数是{}, 用来创建一个空表。可以直接初始化数组:",
{"code","",[[mytable = {}-- 初始化表
mytable[1]= "Lua"-- 指定值
mytable = nil-- 移除引用
-- lua 垃圾回收会释放内存]]},
[[    当我们为 table a 并设置元素, 然后将 a 赋值给 b, 则 a 与 b 都指向同一个内存。如果 a 设置为 nil , 则 b 同样能访问 table 的元素。如果没有指定的变量指向a, Lua的垃圾回收机制会清理相对应的内存。
    以下实例演示了以上的描述情况：]],
{"code","",[[-- 简单的 table
local mytable = {}
print("mytable 的类型是 ",type(mytable))

mytable[1]= "Lua"
mytable["wow"] = "修改前"
print("mytable 索引为 1 的元素是 ", mytable[1])
print("mytable 索引为 wow 的元素是 ", mytable["wow"])

local alternatetable = mytable-- alternatetable和mytable的是指同一个 table

print("alternatetable 索引为 1 的元素是 ", alternatetable[1])
print("mytable 索引为 wow 的元素是 ", alternatetable["wow"])

alternatetable["wow"] = "修改后"

print("mytable 索引为 wow 的元素是 ", mytable["wow"])

alternatetable = nil-- 释放变量
print("alternatetable 是 ", alternatetable)

print("mytable 索引为 wow 的元素是 ", mytable["wow"])-- mytable 仍然可以访问

mytable = nil
print("mytable 是 ", mytable)]]},
{"title","Table 操作"},
"\t\t以下列出了 Table 操作常用的方法：",
{"v_code","",[[table.concat (table [, sep [, start [, end] ] ]):
    concat是concatenate(连接)的缩写. table.concat()函数列出参数中指定table的数组部分从start位置到end位置的所有元素, 元素间以指定的分隔符(sep)隔开。

table.insert (table, [pos,] value):
    在table的数组部分指定位置(pos)插入值为value的一个元素. pos参数可选, 默认为数组部分末尾.

table.remove (table [, pos])
    返回table数组部分位于pos位置的元素. 其后的元素会被前移. pos参数可选, 默认为table长度, 即从最后一个元素删起。

table.sort (table [, comp])
    对给定的table进行排序。]]},
{"title","Table 连接"},
"\t\t我们可以使用 concat() 输出一个列表中元素连接成的字符串:",
{"code","",[[local fruits = {"banana","orange","apple"}
-- 返回 table 连接后的字符串
print("连接后的字符串 ",table.concat(fruits))

-- 指定连接字符
print("连接后的字符串 ",table.concat(fruits,", "))

-- 指定索引来连接 table
print("连接后的字符串 ",table.concat(fruits,", ", 2,3))]]},
{"title","插入和移除"},
{"code","table 的增删操作",[[local fruits = {"banana","orange","apple"}

table.insert(fruits,"mango")-- 在末尾插入
print("索引为 4 的元素为 ",fruits[4])

table.insert(fruits,2,"grapes")-- 在索引为 2 的键处插入
print("索引为 2 的元素为 ",fruits[2])

print("最后一个元素为 ",fruits[5])
table.remove(fruits)
print("移除后最后一个元素为 ",fruits[5])]]},
{"title","排序"},
{"code","sort() 方法",[[local fruits = {"banana","orange","apple","grapes"}
print("排序前")
for k,v in ipairs(fruits) do
    print(k,v)
end

table.sort(fruits)
print("排序后")
for k,v in ipairs(fruits) do
    print(k,v)
end]]},
{"title","最大值"},
{"code","",[[local tab = {2,6,34,5}
print("最大值：", table.maxn(tab))]]},
{"title","计算值数量"},
{"code","",[[local tab = {2,6,34,5}
print("数量", table.size(tab))]]},
},
{
"模块与包",
[[    模块类似于一个封装库, 从 Lua 5.1 开始, Lua 加入了标准的模块管理机制, 可以把一些公用的代码放在一个文件里, 以 API 接口的形式在其他地方调用, 有利于代码的重用和降低代码耦合度。
    Lua 的模块是由变量、函数等已知元素组成的 table, 因此创建一个模块很简单, 就是创建一个 table, 然后把需要导出的常量、函数放入其中, 最后返回这个 table 就行。以下为创建自定义模块 module.lua, 文件代码格式如下：]],
{"n_code","",[[-- 文件名为 module.lua
-- 定义一个名为 module 的模块
local module = {}
 
-- 定义一个常量
module.constant = "这是一个常量"
 
-- 定义一个函数
function module.func1()
    io.write("这是一个公有函数！\n")
end
 
local function func2()
    print("这是一个私有函数！")
end
 
function module.func3()
    func2()
end
 
return module]]},
[[    由上可知, 模块的结构就是一个 table 的结构, 因此可以像操作调用 table 里的元素那样来操作调用模块里的常量或函数。
    上面的 func2 声明为程序块的局部变量, 即表示一个私有函数, 因此是不能从外部访问模块里的这个私有函数, 必须通过模块里的公有函数来调用。]],
{"title","require 函数"},
"\t\tLua提供了一个名为require的函数用来加载模块。要加载一个模块, 只需要简单地调用就可以了。例如：",
{"v_code","",'require "模块名"'},
"\t\t执行 require 后会返回一个由模块常量或函数组成的 table, 并且还会定义一个包含该 table 的全局变量。",
{"n_code","",[[-- test_module.lua 文件
-- module 模块为上文提到到 module.lua
require("module")
 
print(module.constant)
 
module.func3()]]},
"\t\t或者给加载的模块定义一个别名变量, 方便调用：",
{"n_code","",[[-- test_module2.lua 文件
-- module 模块为上文提到到 module.lua
-- 别名变量 m
local m = require("module")
 
print(m.constant)
 
m.func3()]]},
{"title","C 包"},
[[    Lua和C是很容易结合的, 使用 C 为 Lua 写包。与Lua中写包不同, C包在使用以前必须首先加载并连接, 在大多数系统中最容易的实现方式是通过动态连接库机制。
    Lua在一个叫loadlib的函数内提供了所有的动态连接的功能。这个函数有两个参数:库的绝对路径和初始化函数。所以典型的调用的例子如下:]],
{"n_code","",[[local path = "/usr/local/lua/lib/libluasocket.so"
local f = loadlib(path, "luaopen_socket")]]},
[[    loadlib 函数加载指定的库并且连接到 Lua, 然而它并不打开库（也就是说没有调用初始化函数）, 反之他返回初始化函数作为 Lua 的一个函数, 这样我们就可以直接在Lua中调用他。
    如果加载动态库或者查找初始化函数时出错, loadlib 将返回 nil 和错误信息。我们可以修改前面一段代码, 使其检测错误然后调用初始化函数：]],
{"n_code","",[[local path = "/usr/local/lua/lib/libluasocket.so"
local f = assert(loadlib(path, "luaopen_socket"))
f()  -- 真正打开库]]},
},
{
"Metatable(元表)（1/2）",
[[    在 Lua table 中我们可以访问对应的key来得到value值, 但是却无法对两个 table 进行操作。因此 Lua 提供了元表(Metatable), 允许我们改变table的行为, 每个行为关联了对应的元方法。
    例如, 使用元表我们可以定义Lua如何计算两个table的相加操作a+b。当Lua试图对两个表进行相加时, 先检查两者之一是否有元表, 之后检查是否有一个叫"__add"的字段, 若找到, 则调用对应的值。"__add"等即时字段, 其对应的值（往往是一个函数或是table）就是"元方法"。

    有两个很重要的函数来处理元表：]],
{"v_code","",[[setmetatable(table,metatable): 对指定 table 设置元表(metatable), 如果元表(metatable)中存在 __metatable 键值, setmetatable 会失败。

getmetatable(table): 返回对象的元表(metatable)。]]},
{"code","设置元表",[[local mytable = {}   -- 普通表
local mymetatable = {}    -- 元表
setmetatable(mytable,mymetatable)   -- 把 mymetatable 设为 mytable 的元表

--可以简化为
local mytable=setmetatable({
--普通表
},{
--元表
})]]},
{"v_code","获取元表",[[getmetatable(mytable)  -- 返回mymetatable]]},
{"title","__index 元方法"},
[[    这是 metatable 最常用的键。
    当你通过键来访问 table 的时候, 如果这个键没有值, 那么Lua就会寻找该table的metatable（假定有metatable）中的__index 键。如果__index包含一个表格, Lua会在表格中查找相应的键。]],
{"code","",[[other = { foo = 3 }
t = setmetatable({}, { __index = other })
print(t.foo)--3
print(t.bar)--nil]]},
[[    如果__index包含一个函数的话, Lua就会调用那个函数, table和键会作为参数传递给函数。__index 元方法查看表中元素是否存在, 如果不存在, 返回结果为 nil；如果存在则由 __index 返回结果。]],
{"code","",[[mytable = setmetatable({key1 = "value1"}, {
  __index = function(mytable, key)
    if key == "key2" then
      return "metatablevalue"
    else
      return nil
    end
  end})

print(mytable.key1,mytable.key2)]]},
[[实例解析：

    · mytable 表赋值为 {key1 = "value1"}。

    ↓ mytable 设置了元表, 元方法为 __index。

    ↓ 在mytable表中查找 key1, 如果找到, 返回该元素, 找不到则继续。

    ↓ 在mytable表中查找 key2, 如果找到, 返回 metatablevalue, 找不到则继续。

    ↓ 判断元表有没有__index方法, 如果__index方法是一个函数, 则调用该函数。

    · 元方法中查看是否传入 "key2" 键的参数（mytable.key2已设置）, 如果传入 "key2" 参数返回 "metatablevalue", 否则返回 mytable 对应的键值。]],
"\t\t我们可以将以上代码简单写成：",
{"code","",[[mytable = setmetatable({key1 = "value1"}, { __index = { key2 = "metatablevalue" } })
print(mytable.key1,mytable.key2)]]},
[[总结
    Lua 查找一个表元素时的规则, 其实就是如下 3 个步骤:

    1.在表中查找, 如果找到, 返回该元素, 找不到则继续
    2.判断该表是否有元表, 如果没有元表, 返回 nil, 有元表则继续。
    3.判断元表有没有 __index 方法, 如果 __index 方法为 nil, 则返回 nil；如果 __index 方法是一个表, 则重复 1、2、3；如果 __index 方法是一个函数, 则返回该函数的返回值。]],
{"title","__newindex 元方法"},
[[    __newindex 元方法用来对表更新, __index则用来对表访问 。当你给表的一个缺少的索引赋值, 解释器就会查找__newindex 元方法：如果存在则调用这个函数而不进行赋值操作。

    以下实例演示了 __newindex 元方法的应用：]],
{"code","",[[lcoal mymetatable = {}
local mytable = setmetatable({key1 = "value1"}, { __newindex = mymetatable })

print(mytable.key1)

mytable.newkey = "新值2"
print(mytable.newkey,mymetatable.newkey)

mytable.key1 = "新值1"
print(mytable.key1,mymetatable.key1)]]},
[[    以上实例中表设置了元方法 __newindex, 在对新索引键（newkey）赋值时（mytable.newkey = "新值2"）, 会调用元方法, 而不进行赋值。而如果对已存在的索引键（key1）, 则会进行赋值, 而不调用元方法 __newindex。

    以下实例使用了 rawset 函数来更新表：]],
{"n_code","",[[local mytable = setmetatable({key1 = "value1"}, {
  __newindex = function(mytable, key, value)
                rawset(mytable, key, "\""..value.."\"")
  end})

mytable.key1 = "new value"
mytable.key2 = 4

print(mytable.key1,mytable.key2)]]},
},
{
"Metatable(元表)（2/2）",
{"title","为表添加操作符"},
"\t\t以下实例演示了两表相加操作：",
{"code","",[[local mytable = setmetatable({ 1, 2, 3 }, {
  __add = function(mytable, newtable)
    for i = 1, table_maxn(newtable) do
      table.insert(mytable, table_maxn(mytable)+1,newtable[i])
    end
    return mytable
  end
})

local secondtable = {4,5,6}

local mytable = mytable + secondtable

for k,v in ipairs(mytable) do
print(k,v)
end]]},
"\t\t__add 键包含在元表中, 并进行相加操作。 表中对应的操作列表如下：(注意：__是两个下划线)",
[[模式	描述
__add	对应的运算符 '+'.
__sub	对应的运算符 '-'.
__mul	对应的运算符 '*'.
__div	对应的运算符 '/'.
__mod	对应的运算符 '%'.
__unm	对应的运算符 '-'.
__concat	对应的运算符 '..'.
__eq	对应的运算符 '=='.
__lt	对应的运算符 '<'.
__le	对应的运算符 '<='.]],
{"title","__call 元方法"},
"\t\t__call 元方法在 Lua 调用一个值时调用。以下实例演示了计算表中元素的和：",
{"code","",[[local mytable = setmetatable({10}, {
  __call = function(mytable, newtable)
        sum = 0
        for i = 1, table.maxn(mytable) do
                sum = sum + mytable[i]
        end
    for i = 1, table_maxn(newtable) do
                sum = sum + newtable[i]
        end
        return sum
  end
})
local newtable = {10,20,30}
print(mytable(newtable))]]},
{"title","__tostring 元方法"},
"\t\t__tostring 元方法用于修改表的输出行为。以下实例我们自定义了表的输出内容：",
{"code","",[[local mytable = setmetatable({ 10, 20, 30 }, {
  __tostring = function(mytable)
    sum = 0
    for k, v in pairs(mytable) do
                sum = sum + v
        end
    return "表所有元素的和为 " .. sum
  end
})
print(mytable)]]},
"\t\t从本文中我们可以知道元表可以很好的简化我们的代码功能, 所以了解 Lua 的元表, 可以让我们写出更加简单优秀的 Lua 代码。",
},
{
"coroutine(协同程序)",
{"title","什么是协程(coroutine)？"},
[[    Lua 协同程序(coroutine)与线程比较类似：拥有独立的堆栈, 独立的局部变量, 独立的指令指针, 同时又与其它协同程序共享全局变量和其它大部分东西。

    协程是非常强大的功能, 但是用起来也很复杂。]],
{"title","线程和协程的区别"},
[[    线程与协同程序的主要区别在于, 一个具有多个线程的程序可以同时运行几个线程, 而协同程序却需要彼此协作的运行。在任一指定时刻只有一个协同程序在运行, 并且这个正在运行的协同程序只有在明确的被要求挂起的时候才会被挂起。
    协同程序有点类似同步的多线程, 在等待同一个线程锁的几个线程有点类似协同。]],
{"title","基本语法"},
[[方法	描述
coroutine.create()	创建 coroutine, 返回 coroutine,  参数是一个函数, 当和 resume 配合使用的时候就唤醒函数调用

coroutine.resume()	重启 coroutine, 和 create 配合使用

coroutine.yield()	挂起 coroutine, 将 coroutine 设置为挂起状态, 这个和 resume 配合使用能有很多有用的效果

coroutine.status()	查看 coroutine 的状态
注：coroutine 的状态有三种：dead, suspended, running, 具体什么时候有这样的状态请参考下面的程序

coroutine.wrap（）	创建 coroutine, 返回一个函数, 一旦你调用这个函数, 就进入 coroutine, 和 create 功能重复

coroutine.running()	返回正在跑的 coroutine, 一个 coroutine 就是一个线程, 当使用running的时候, 就是返回一个 corouting 的线程号]],
"\t\t以下实例演示了以上各个方法的用法：",
{"code","",[[co = coroutine.create(function(i)
        print(i)
    end)
 
coroutine.resume(co, 1)   -- 1
print(coroutine.status(co))  -- dead

co = coroutine.wrap(function(i)
        print(i)
    end)
 
co(1)

co2 = coroutine.create(function()
        for i=1,10 do
            print(i)
            if i == 3 then
                print(coroutine.status(co2))  --running
                print(coroutine.running()) --thread:XXXXXX
            end
            coroutine.yield()
        end
    end)
 
coroutine.resume(co2) --1
coroutine.resume(co2) --2
coroutine.resume(co2) --3
 
print(coroutine.status(co2))   -- suspended
print(coroutine.running())]]},
[[    coroutine.running就可以看出来,coroutine在底层实现就是一个线程。当create一个coroutine的时候就是在新线程中注册了一个事件。
    当使用resume触发事件的时候, create的coroutine函数就被执行了, 当遇到yield的时候就代表挂起当前线程, 等候再次resume触发事件。

    接下来我们分析一个更详细的实例：]],
{"code","",[[function foo (a)
    print("foo 函数输出", a)
    return coroutine.yield(2 * a) -- 返回  2*a 的值
end
 
local co = coroutine.create(function (a , b)
    print("第一次协同程序执行输出", a, b) -- co-body 1 10
    local r = foo(a + 1)
     
    print("第二次协同程序执行输出", r)
    local r, s = coroutine.yield(a + b, a - b)  -- a, b的值为第一次调用协同程序时传入
     
    print("第三次协同程序执行输出", r, s)
    return b, "结束协同程序"                   -- b的值为第二次调用协同程序时传入
end)
       
print("main", coroutine.resume(co, 1, 10)) -- true, 4
print("main", coroutine.resume(co, "r")) -- true 11 -9
print("main", coroutine.resume(co, "x", "y")) -- true 10 end
print("main", coroutine.resume(co, "x", "y")) -- cannot resume dead coroutine]]},
[[以上实例接下如下：

    · 调用resume, 将协同程序唤醒,resume操作成功返回true, 否则返回false

    ↓ 协同程序运行

    ↓ 运行到yield语句

    ↓ yield挂起协同程序, 第一次resume返回；（注意：此处yield返回, 参数是resume的参数）

    ↓ 第二次resume, 再次唤醒协同程序；（注意：此处resume的参数中, 除了第一个参数, 剩下的参数将作为yield的参数）

    ↓ yield返回

    ↓ 协同程序继续运行

    · 如果使用的协同程序继续运行完成后继续调用 resume方法则输出：cannot resume dead coroutine
resume和yield的配合强大之处在于, resume处于主程中, 它将外部状态（数据）传入到协同程序内部；而yield则将内部的状态（数据）返回到主程中。]],
"\t\tresume和yield的配合强大之处在于, resume处于主程中, 它将外部状态（数据）传入到协同程序内部；而yield则将内部的状态（数据）返回到主程中。",
{"title","生产者-消费者问题"},
"\t\t现在我就使用Lua的协同程序来完成生产者-消费者这一经典问题。",
{"code","",[[local newProductor

function productor()
     local i = 0
     while true do
          i = i + 1
          send(i)     -- 将生产的物品发送给消费者
     end
end

function consumer()
     while true do
          local i = receive()     -- 从生产者那里得到物品
          print(i)
     end
end

function receive()
     local status, value = coroutine.resume(newProductor)
     return value
end

function send(x)
     coroutine.yield(x)     -- x表示需要发送的值, 值返回以后, 就挂起该协同程序
end

-- 启动程序
newProductor = coroutine.create(productor)
consumer()]]},
},
{
"文件 I/O",
[[    I/O 库用于读取和处理文件。分为简单模式（和C一样）、完全模式。

    简单模式（simple model）拥有一个当前输入文件和一个当前输出文件, 并且提供针对这些文件相关的操作。
    完全模式（complete model） 使用外部的文件句柄来实现。它以一种面对对象的形式, 将所有的文件操作定义为文件句柄的方法
简单模式在做一些简单的文件操作时较为合适。但是在进行一些高级的文件操作的时候, 简单模式就显得力不从心。例如同时读取多个文件这样的操作, 使用完全模式则较为合适。

    打开文件操作语句如下：]],
{"v_code","","io.open (filename [, mode])"},
"\t\tmode 的值有：",
[[模式	描述
r	以只读方式打开文件, 该文件必须存在。
w	打开只写文件, 若文件存在则文件长度清为0, 即该文件内容会消失。若文件不存在则建立该文件。
a	以附加的方式打开只写文件。若文件不存在, 则会建立该文件, 如果文件存在, 写入的数据会被加到文件尾, 即文件原先的内容会被保留。（EOF符保留）
r+	以可读写方式打开文件, 该文件必须存在。
w+	打开可读写文件, 若文件存在则文件长度清为零, 即该文件内容会消失。若文件不存在则建立该文件。
a+	与a类似, 但此文件可读可写
b	二进制模式, 如果文件是二进制文件, 可以加上b
+	号表示对文件既可以读也可以写]],
{"title","简单模式"},
[[    简单模式使用标准的 I/O 或使用一个当前输入文件和一个当前输出文件。
    以下为 file.lua 文件代码, 操作的文件为test.lua(如果没有你需要创建该文件), 代码如下：]],
{"n_code","",[[-- 以只读方式打开文件
local file = io.open("test.lua", "r")

-- 设置默认输入文件为 test.lua
io.input(file)

-- 输出文件第一行
print(io.read())

-- 关闭打开的文件
io.close(file)

-- 以附加的方式打开只写文件
file = io.open("test.lua", "a")

-- 设置默认输出文件为 test.lua
io.output(file)

-- 在文件最后一行添加 Lua 注释
io.write("--  test.lua 文件末尾注释")

-- 关闭打开的文件
io.close(file)]]},
'\t\t在以上实例中我们使用了 io."x" 方法, 其中 io.read() 中我们没有带参数, 参数可以是下表中的一个：',
[[模式	描述
"*n"	读取一个数字并返回它。例：file.read("*n")
"*a"	从当前位置读取整个文件。例：file.read("*a")
"*l"（默认）	读取下一行, 在文件尾 (EOF) 处返回 nil。例：file.read("*l")
number	返回一个指定字符个数的字符串, 或在 EOF 时返回 nil。例：file.read(5)]],
"其他的 io 方法有：",
[[    io.tmpfile():返回一个临时文件句柄, 该文件以更新模式打开, 程序结束时自动删除

    io.type(file): 检测obj是否一个可用的文件句柄

    io.flush(): 向文件写入缓冲中的所有数据

    io.lines(optional file name): 返回一个迭代函数,每次调用将获得文件中的一行内容,当到文件尾时, 将返回nil,但不关闭文件]],
{"title","完全模式"},
"\t\t通常我们需要在同一时间处理多个文件。我们需要使用 file:function_name 来代替 io.function_name 方法。以下实例演示了如何同时处理同一个文件:",
{"n_code","",[[-- 以只读方式打开文件
file = io.open("test.lua", "r")

-- 输出文件第一行
print(file:read())

-- 关闭打开的文件
file:close()

-- 以附加的方式打开只写文件
file = io.open("test.lua", "a")

-- 在文件最后一行添加 Lua 注释
file:write("--test")

-- 关闭打开的文件
file:close()]]},
"   read 的参数与简单模式一致。",
"其他方法:",
[[    file:seek(optional whence, optional offset): 设置和获取当前文件位置,成功则返回最终的文件位置(按字节),失败则返回nil加错误信息。参数 whence 值可以是:
    "set": 从文件头开始
    "cur": 从当前位置开始[默认]
    "end": 从文件尾开始
    offset:默认为0
    不带参数file:seek()则返回当前位置,file:seek("set")则定位到文件头,file:seek("end")则定位到文件尾并返回文件大小

    io.lines(optional file name): 打开指定的文件filename为读模式并返回一个迭代函数,每次调用将获得文件中的一行内容,当到文件尾时, 将返回nil,并自动关闭文件。
    若不带参数时io.lines() <=> io.input():lines(); 读取默认输入设备的内容, 但结束时不关闭文件,如：]],
{"n_code","",[[for line in io.lines("main.lua") do
　　print(line)
end]]},
"\t\t以下实例使用了 seek 方法, 定位到文件倒数第 25 个位置并使用 read 方法的 *a 参数, 即从当期位置(倒数第 25 个位置)读取整个文件。",
{"n_code","",[[-- 以只读方式打开文件
local file = io.open("test.lua", "r")

file:seek("end",-25)
print(file:read("*a"))

-- 关闭打开的文件
file:close()]]},
},
{
"错误处理",
[[    程序运行中错误处理是必要的, 在我们进行文件操作, 数据转移及web service 调用过程中都会出现不可预期的错误。如果不注重错误信息的处理, 就会造成信息泄露, 程序无法运行等情况。

    任何程序语言中, 都需要错误处理。错误类型有：
    · 语法错误
    · 运行错误]],
{"title","语法错误"},
"\t\t语法错误通常是由于对程序的组件（如运算符、表达式）使用不当引起的。一个简单的实例如下：",
{"v_code","","a == 2"},
[[语法错误会使程序无法正常执行。以上代码执行结果为：lua: syntax error near '==']],
{"title","运行错误"},
"\t\t运行错误是程序可以正常执行, 但是会输出报错信息。如下实例由于参数输入错误, 程序执行时报错：",
{"v_code","",[[function add(a,b)
   return a+b
end

add(10)]]},
[[当我们运行以上代码时, 会产生如下错误：lua: attempt to perform arithmetic on local 'b' (a nil value)]],
"\t\t以上报错信息是由于程序缺少 b 参数引起的。",
{"title","错误处理"},
"\t\t我们可以使用 assert 和 error 来处理错误。实例如下：",
{"v_code","",[[local function add(a,b)
   assert(type(a) == "number", "a 不是一个数字")
   assert(type(b) == "number", "b 不是一个数字")
   return a+b
end
add(10)]]},
"\t\t执行以上代码会出现如下错误：lua:3: b 不是一个数字\n\t\tassert 首先检查第一个参数, 若没问题, assert不做任何事情；否则, assert以第二个参数作为错误信息抛出。",
{"title","error函数"},
{"v_code","","error (message [, level])"},
[[功能：
    终止正在执行的函数, 并返回message的内容作为错误信息(error函数永远都不会返回)。通常情况下, error会附加一些错误位置的信息到message头部。
    Level参数指示获得错误的位置:
    · Level=1[默认]：为调用error位置(文件+行号)
    · Level=2：指出哪个调用error的函数的函数
    · Level=0:不添加错误位置信息]],
{"title","pcall 和 xpcall、debug"},
[[    在 Lua 中可以使用函数pcall（protected call）来包装需要执行的代码来处理错误,。pcall 接收一个函数和要传递给后者的参数,并执行, 执行结果：有无错误, 错误信息或函数返回值。
    语法错误无法被 pcall 和 xpcall 处理。]],
{"code","简单实例",[[pcall(function(i)
    print(i)
end, 33)--33    true
   
pcall(function(i)
    print(i)
    error('error..')
end, 33)--33    false   lua: error..]]},
[[    pcall 以一种"保护模式"来调用第一个参数, 因此 pcall 可以捕获函数执行中的任何错误。通常在错误发生时, 希望落得更多的调试信息, 而不只是发生错误的位置。但 pcall 返回时, 它已经销毁了调用桟的部分内容。
    Lua 提供了 xpcall 函数, xpcall 接收第二个参数——一个错误处理函数, 当错误发生时, Lua 会在调用桟展开（unwind）前调用错误处理函数, 于是就可以在这个函数中使用 debug 库来获取关于错误的额外信息了。]],
[[debug库提供了两个通用的错误处理函数:

    · debug.debug：提供一个Lua提示符, 让用户来检查错误的原因
    · debug.traceback：根据调用桟来构建一个扩展的错误消息]],
"xpcall 使用实例 2:",
{"code","",[[local status,result = xpcall(function()
   return n/s
end,function( err )
   print( "ERROR:", err )
end)
print( status)]]},
[[执行以上程序会出现如下错误：

    ERROR:    lua: attempt to perform arithmetic on global 'n' (a nil value)    false]],
},
{
"Debug(调试)",
[[    Lua 提供了 debug 库用于提供创建我们自定义调试器的功能。Lua 本身并未有内置的调试器, 但很多开发者共享了他们的 Lua 调试器代码。

    Lua 中 debug 库包含以下函数：]],
[[方法 & 用途
debug():
    进入一个用户交互模式, 运行用户输入的每个字符串。 使用简单的命令以及其它调试设置, 用户可以检阅全局变量和局部变量,  改变变量的值, 计算一些表达式, 等等。
输入一行仅包含 cont 的字符串将结束这个函数,  这样调用者就可以继续向下运行。

getfenv(object):
    返回对象的环境变量。

gethook(optional thread):
    返回三个表示线程钩子设置的值： 当前钩子函数, 当前钩子掩码, 当前钩子计数

getinfo ([thread,] f [, what]):
    返回关于一个函数信息的表。 你可以直接提供该函数,  也可以用一个数字 f 表示该函数。 数字 f 表示运行在指定线程的调用栈对应层次上的函数： 0 层表示当前函数（getinfo 自身）； 1 层表示调用 getinfo 的函数 （除非是尾调用, 这种情况不计入栈）；等等。 如果 f 是一个比活动函数数量还大的数字,  getinfo 返回 nil。

debug.getlocal ([thread,] f, local):
    此函数返回在栈的 f 层处函数的索引为 local 的局部变量 的名字和值。 这个函数不仅用于访问显式定义的局部变量, 也包括形参、临时变量等。

getmetatable(value):
    把给定索引指向的值的元表压入堆栈。如果索引无效, 或是这个值没有元表, 函数将返回 0 并且不会向栈上压任何东西。

getregistry():
    返回注册表表, 这是一个预定义出来的表,  可以用来保存任何 C 代码想保存的 Lua 值。

getupvalue (f, up)
    此函数返回函数 f 的第 up 个上值的名字和值。 如果该函数没有那个上值, 返回 nil 。
以 '(' （开括号）打头的变量名表示没有名字的变量 （去除了调试信息的代码块）。

sethook ([thread,] hook, mask [, count]):
    将一个函数作为钩子函数设入。 字符串 mask 以及数字 count 决定了钩子将在何时调用。 掩码是由下列字符组合成的字符串, 每个字符有其含义：
    'c': 每当 Lua 调用一个函数时, 调用钩子；
    'r': 每当 Lua 从一个函数内返回时, 调用钩子；
    'l': 每当 Lua 进入新的一行时, 调用钩子。

setlocal ([thread,] level, local, value):
    这个函数将 value 赋给 栈上第 level 层函数的第 local 个局部变量。 如果没有那个变量, 函数返回 nil 。 如果 level 越界, 抛出一个错误。

setmetatable (value, table):
    将 value 的元表设为 table （可以是 nil）。 返回 value。

setupvalue (f, up, value):
    这个函数将 value 设为函数 f 的第 up 个上值。 如果函数没有那个上值, 返回 nil 否则, 返回该上值的名字。

traceback ([thread,] [message [, level] ]),
    如果 message 有, 且不是字符串或 nil,  函数不做任何处理直接返回 message。 否则, 它返回调用栈的栈回溯信息。 字符串可选项 message 被添加在栈回溯信息的开头。 数字可选项 level 指明从栈的哪一层开始回溯 （默认为 1 , 即调用 traceback 的那里）。]],
"\t\t上表列出了我们常用的调试函数, 接下来我们可以看些简单的例子：",
{"code","",[[local function myfunction ()
print(debug.traceback("Stack trace"))
print(debug.getinfo(1))
print("Stack trace end")
        return 10
end

myfunction ()
print(debug.getinfo(1))]]},
"\t\t在以实例中, 我们使用到了 debug 库的 traceback 和 getinfo 函数,  getinfo 函数用于返回函数信息的表。",
{"title","另一个实例"},
"\t\t我们经常需要调试函数的内的局部变量。我们可以使用 getupvalue 函数来设置这些局部变量。实例如下：",
{"code","",[[local function newCounter ()
  local n = 0
  local k = 0
  return function ()
    k = n
    n = n + 1
    return n
    end
end

counter = newCounter ()
print(counter())
print(counter())

local i = 1
local name, val

repeat
  name, val = debug.getupvalue(counter, i)
  if name then
    print ("index", i, name, "=", val)
        if(name == "n") then
                debug.setupvalue (counter,2,10)
        end
    i = i + 1
  end -- if
until not name

print(counter())]]},
"\t\t在以上实例中, 计数器在每次调用时都会自增1。实例中我们使用了 getupvalue 函数查看局部变量的当前状态。我们可以设置局部变量为新值。实例中, 在设置前 n 的值为 2,使用 setupvalue 函数将其设置为 10。现在我们调用函数, 执行后输出为 11 而不是 3。",
},
{
"垃圾回收",
[[    Lua 采用了自动内存管理。 这意味着你不用操心新创建的对象需要的内存如何分配出来,  也不用考虑在对象不再被使用后怎样释放它们所占用的内存。
    Lua 运行了一个垃圾收集器来收集所有死对象 （即在 Lua 中不可能再访问到的对象）来完成自动内存管理的工作。 Lua 中所有用到的内存, 如：字符串、表、用户数据、函数、线程、 内部结构等, 都服从自动管理。
    Lua 实现了一个增量标记-扫描收集器。 它使用这两个数字来控制垃圾收集循环： 垃圾收集器间歇率和垃圾收集器步进倍率。 这两个数字都使用百分数为单位 （例如：值 100 在内部表示 1 ）。
    垃圾收集器间歇率控制着收集器需要在开启新的循环前要等待多久。 增大这个值会减少收集器的积极性。 当这个值比 100 小的时候, 收集器在开启新的循环前不会有等待。 设置这个值为 200 就会让收集器等到总内存使用量达到 之前的两倍时才开始新的循环。
    垃圾收集器步进倍率控制着收集器运作速度相对于内存分配速度的倍率。 增大这个值不仅会让收集器更加积极, 还会增加每个增量步骤的长度。 不要把这个值设得小于 100 ,  那样的话收集器就工作的太慢了以至于永远都干不完一个循环。 默认值是 200 , 这表示收集器以内存分配的"两倍"速工作。
    如果你把步进倍率设为一个非常大的数字 （比你的程序可能用到的字节数还大 10% ）,  收集器的行为就像一个 stop-the-world 收集器。 接着你若把间歇率设为 200 ,  收集器的行为就和过去的 Lua 版本一样了： 每次 Lua 使用的内存翻倍时, 就做一次完整的收集。]],
{"title","垃圾回收器函数"},
[[Lua 提供了以下函数collectgarbage ([opt [, arg] ])用来控制自动内存管理:

    collectgarbage("collect"): 做一次完整的垃圾收集循环。通过参数 opt 它提供了一组不同的功能：

    collectgarbage("count"): 以 K 字节数为单位返回 Lua 使用的总内存数。 这个值有小数部分, 所以只需要乘上 1024 就能得到 Lua 使用的准确字节数（除非溢出）。

    collectgarbage("restart"): 重启垃圾收集器的自动运行。

    collectgarbage("setpause"): 将 arg 设为收集器的 间歇率 （参见 §2.5）。 返回 间歇率 的前一个值。

    collectgarbage("setstepmul"): 返回 步进倍率 的前一个值。

    collectgarbage("step"): 单步运行垃圾收集器。 步长"大小"由 arg 控制。 传入 0 时, 收集器步进（不可分割的）一步。 传入非 0 值,  收集器收集相当于 Lua 分配这些多（K 字节）内存的工作。 如果收集器结束一个循环将返回 true 。

    collectgarbage("stop"): 停止垃圾收集器的运行。 在调用重启前, 收集器只会因显式的调用运行。]],
{"code","简单的垃圾回收实例",[[local mytable = {"apple", "orange", "banana"}

print(collectgarbage("count"))

mytable = nil

print(collectgarbage("count"))
collectgarbage("collect")
print(collectgarbage("count"))]]},
},
{
"面向对象（1/2）",
"\t\t面向对象编程（Object Oriented Programming, OOP）是一种非常流行的计算机编程架构。",
{"title","面向对象特征"},
[[  1） 封装：指能够把一个实体的信息、功能、响应都装入一个单独的对象中的特性。

    2） 继承：继承的方法允许在不改动原程序的基础上对其进行扩充, 这样使得原功能得以保存, 而新功能也得以扩展。这有利于减少重复编码, 提高软件的开发效率。

    3） 多态：同一操作作用于不同的对象, 可以有不同的解释, 产生不同的执行结果。在运行时, 可以通过指向基类的指针, 来调用实现派生类中的方法。

    4）抽象：抽象(Abstraction)是简化复杂的现实问题的途径, 它可以为具体问题找到最恰当的类定义, 并且可以在最恰当的继承级别解释问题。]],
{"title","Lua 中面向对象"},
[[   我们知道, 对象由属性和方法组成。LUA中最基本的结构是table, 所以需要用table来描述对象的属性。lua 中的 function 可以用来表示方法。那么LUA中的类可以通过 table + function 模拟出来。
    至于继承, 可以通过 metetable 模拟出来（不推荐用, 只模拟最基本的对象大部分时间够用了）。
    Lua 中的表不仅在某种意义上是一种对象。像对象一样, 表也有状态（成员变量）；也有与对象的值独立的本性, 特别是拥有两个不同值的对象（table）代表两个不同的对象；一个对象在不同的时候也可以有不同的值, 但他始终是一个对象；与对象类似, 表的生命周期与其由什么创建、在哪创建没有关系。对象有他们的成员函数, 表也有：]],
{"code","",[[local Account = {balance = 0}
function Account.withdraw (v)
    Account.balance = Account.balance - v
end]]},
"\t\t这个定义创建了一个新的函数, 并且保存在Account对象的withdraw域内。",
{"title","一个简单实例"},
"\t\t以下简单的类包含了三个属性： area, length 和 breadth, printArea方法用于打印计算结果：",
{"code","",[[-- 元类
local Rectangle = {area = 0, length = 0, breadth = 0}

-- 派生类的方法 new
function Rectangle:new (o,length,breadth)
  o = o or {}
  setmetatable(o, self)
  self.__index = self
  self.length = length or 0
  self.breadth = breadth or 0
  self.area = length*breadth;
  return o
end

-- 派生类的方法 printArea
function Rectangle:printArea ()
  print("矩形面积为 ",self.area)
end]]},
{"title","创建对象"},
"\t\t创建对象是为类的实例分配内存的过程。每个类都有属于自己的内存并共享公共数据。",
{"n_code","","r = Rectangle:new(nil,10,20)"},
{"title","访问属性"},
"\t\t我们可以使用点号(.)来访问类的属性：",
{"n_code","","print(r.length)"},
{"title","访问成员函数"},
"\t\t我们可以使用冒号 : 来访问类的成员函数：",
{"n_code","","r:printArea()"},
"\t\t内存在对象初始化时分配。",
{"title","完整实例"},
"\t\t以下我们演示了 Lua 面向对象的完整实例：",
{"code","",[[-- 元类
local Shape = {area = 0}

-- 基础类方法 new
function Shape:new (o,side)
  o = o or {}
  setmetatable(o, self)
  self.__index = self
  side = side or 0
  self.area = side*side;
  return o
end

-- 基础类方法 printArea
function Shape:printArea ()
  print("面积为 ",self.area)
end

-- 创建对象
local myshape = Shape:new(nil,10)

myshape:printArea()]]},
},
{
"面向对象（2/2）",
{"title","Lua 继承"},
[[    继承是指一个对象直接使用另一对象的属性和方法。可用于扩展基础类的属性和方法。
    以下演示了一个简单的继承实例：]],
{"code","",[[-- Meta class
local Shape = {area = 0}

-- 基础类方法 new
function Shape:new (o,side)
  o = o or {}
  setmetatable(o, self)
  self.__index = self
  side = side or 0
  self.area = side*side;
  return o
end
-- 基础类方法 printArea
function Shape:printArea ()
  print("面积为 ",self.area)
end]]},
"\t\t接下来的实例, Square 对象继承了 Shape 类:",
{"code","",[[local Square = Shape:new()

function Square:new (o,side)
  o = o or Shape:new(o,side)
  setmetatable(o, self)
  self.__index = self
  return o
end]]},
{"title","完整实例"},
"\t\t以下实例我们继承了一个简单的类, 来扩展派生类的方法, 派生类中保留了继承类的成员变量和方法：",
{"code","",[[-- 元类
local Shape = {area = 0}
-- 基础类方法 new
function Shape:new (o,side)
  o = o or {}
  setmetatable(o, self)
  self.__index = self
  side = side or 0
  self.area = side*side;
  return o
end
-- 基础类方法 printArea
function Shape:printArea ()
  print("面积为 ",self.area)
end

-- 创建对象
local myshape = Shape:new(nil,10)
myshape:printArea()

local Square = Shape:new()
-- 派生类方法 new
function Square:new (o,side)
  o = o or Shape:new(o,side)
  setmetatable(o, self)
  self.__index = self
  return o
end

-- 派生类方法 printArea
function Square:printArea ()
  print("正方形面积为 ",self.area)
end

-- 创建对象
lcoal mysquare = Square:new(nil,10)
mysquare:printArea()

local Rectangle = Shape:new()
-- 派生类方法 new
function Rectangle:new (o,length,breadth)
  o = o or Shape:new(o)
  setmetatable(o, self)
  self.__index = self
  self.area = length * breadth
  return o
end

-- 派生类方法 printArea
function Rectangle:printArea ()
  print("矩形面积为 ",self.area)
end

-- 创建对象
local myrectangle = Rectangle:new(nil,10,20)
myrectangle:printArea()]]},
{"title","函数重写"},
"\t\tLua 中我们可以重写基础类的函数, 在派生类中定义自己的实现方式：",
{"n_code","",[[-- 派生类方法 printArea
function Square:printArea ()
  print("正方形面积 ",self.area)
end]]},
},
}