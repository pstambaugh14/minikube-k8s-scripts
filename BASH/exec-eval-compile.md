What's the difference between eval, exec, and compile?

The short answer, or TL;DR

Basically, eval is used to evaluate a single dynamically generated Python expression, and exec is used to execute dynamically generated Python code only for its side effects.

eval and exec have these two differences:

    eval accepts only a single expression, exec can take a code block that has Python statements: loops, try: except:, class and function/method definitions and so on.

    An expression in Python is whatever you can have as the value in a variable assignment:

    a_variable = (anything you can put within these parentheses is an expression)

    eval returns the value of the given expression, whereas exec ignores the return value from its code, and always returns None (in Python 2 it is a statement and cannot be used as an expression, so it really does not return anything).

In versions 1.0 - 2.7, exec was a statement, because CPython needed to produce a different kind of code object for functions that used exec for its side effects inside the function.

In Python 3, exec is a function; its use has no effect on the compiled bytecode of the function where it is used.

Thus basically:

>>> a = 5
>>> eval('37 + a')   # it is an expression
42
>>> exec('37 + a')   # it is an expression statement; value is ignored (None is returned)
>>> exec('a = 47')   # modify a global variable as a side effect
>>> a
47
>>> eval('a = 47')  # you cannot evaluate a statement
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  File "<string>", line 1
    a = 47
      ^
SyntaxError: invalid syntax

The compile in 'exec' mode compiles any number of statements into a bytecode that implicitly always returns None, whereas in 'eval' mode it compiles a single expression into bytecode that returns the value of that expression.

>>> eval(compile('42', '<string>', 'exec'))  # code returns None
>>> eval(compile('42', '<string>', 'eval'))  # code returns 42
42
>>> exec(compile('42', '<string>', 'eval'))  # code returns 42,
>>>                                          # but ignored by exec

In the 'eval' mode (and thus with the eval function if a string is passed in), the compile raises an exception if the source code contains statements or anything else beyond a single expression:

>>> compile('for i in range(3): print(i)', '<string>', 'eval')
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  File "<string>", line 1
    for i in range(3): print(i)
      ^
SyntaxError: invalid syntax

Actually the statement "eval accepts only a single expression" applies only when a string (which contains Python source code) is passed to eval. Then it is internally compiled to bytecode using compile(source, '<string>', 'eval') This is where the difference really comes from.

If a code object (which contains Python bytecode) is passed to exec or eval, they behave identically, excepting for the fact that exec ignores the return value, still returning None always. So it is possible use eval to execute something that has statements, if you just compiled it into bytecode before instead of passing it as a string:

>>> eval(compile('if 1: print("Hello")', '<string>', 'exec'))
Hello
>>>

works without problems, even though the compiled code contains statements. It still returns None, because that is the return value of the code object returned from compile.

In the 'eval' mode (and thus with the eval function if a string is passed in), the compile raises an exception if the source code contains statements or anything else beyond a single expression:

>>> compile('for i in range(3): print(i)', '<string>'. 'eval')
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  File "<string>", line 1
    for i in range(3): print(i)
      ^
SyntaxError: invalid syntax

The longer answer, a.k.a the gory details
exec and eval

The exec function (which was a statement in Python 2) is used for executing a dynamically created statement or program:

>>> program = '''
for i in range(3):
    print("Python is cool")
'''
>>> exec(program)
Python is cool
Python is cool
Python is cool
>>>

The eval function does the same for a single expression, and returns the value of the expression:

>>> a = 2
>>> my_calculation = '42 * a'
>>> result = eval(my_calculation)
>>> result
84

exec and eval both accept the program/expression to be run either as a str, unicode or bytes object containing source code, or as a code object which contains Python bytecode.

If a str/unicode/bytes containing source code was passed to exec, it behaves equivalently to:

exec(compile(source, '<string>', 'exec'))

and eval similarly behaves equivalent to:

eval(compile(source, '<string>', 'eval'))

Since all expressions can be used as statements in Python (these are called the Expr nodes in the Python abstract grammar; the opposite is not true), you can always use exec if you do not need the return value. That is to say, you can use either eval('my_func(42)') or exec('my_func(42)'), the difference being that eval returns the value returned by my_func, and exec discards it:

>>> def my_func(arg):
...     print("Called with %d" % arg)
...     return arg * 2
...
>>> exec('my_func(42)')
Called with 42
>>> eval('my_func(42)')
Called with 42
84
>>>

Of the 2, only exec accepts source code that contains statements, like def, for, while, import, or class, the assignment statement (a.k.a a = 42), or entire programs:

>>> exec('for i in range(3): print(i)')
0
1
2
>>> eval('for i in range(3): print(i)')
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  File "<string>", line 1
    for i in range(3): print(i)
      ^
SyntaxError: invalid syntax

Both exec and eval accept 2 additional positional arguments - globals and locals - which are the global and local variable scopes that the code sees. These default to the globals() and locals() within the scope that called exec or eval, but any dictionary can be used for globals and any mapping for locals (including dict of course). These can be used not only to restrict/modify the variables that the code sees, but are often also used for capturing the variables that the executed code creates:

>>> g = dict()
>>> l = dict()
>>> exec('global a; a, b = 123, 42', g, l)
>>> g['a']
123
>>> l
{'b': 42}

(If you display the value of the entire g, it would be much longer, because exec and eval add the built-ins module as __builtins__ to the globals automatically if it is missing).

In Python 2, the official syntax for the exec statement is actually exec code in globals, locals, as in

>>> exec 'global a; a, b = 123, 42' in g, l

However the alternate syntax exec(code, globals, locals) has always been accepted too (see below).
compile

The compile(source, filename, mode, flags=0, dont_inherit=False, optimize=-1) built-in can be used to speed up repeated invocations of the same code with exec or eval by compiling the source into a code object beforehand. The mode parameter controls the kind of code fragment the compile function accepts and the kind of bytecode it produces. The choices are 'eval', 'exec' and 'single':

    'eval' mode expects a single expression, and will produce bytecode that when run will return the value of that expression:

    >>> dis.dis(compile('a + b', '<string>', 'eval'))
      1           0 LOAD_NAME                0 (a)
                  3 LOAD_NAME                1 (b)
                  6 BINARY_ADD
                  7 RETURN_VALUE

    'exec' accepts any kinds of python constructs from single expressions to whole modules of code, and executes them as if they were module top-level statements. The code object returns None:

    >>> dis.dis(compile('a + b', '<string>', 'exec'))
      1           0 LOAD_NAME                0 (a)
                  3 LOAD_NAME                1 (b)
                  6 BINARY_ADD
                  7 POP_TOP                             <- discard result
                  8 LOAD_CONST               0 (None)   <- load None on stack
                 11 RETURN_VALUE                        <- return top of stack

    'single' is a limited form of 'exec' which accepts a source code containing a single statement (or multiple statements separated by ;) if the last statement is an expression statement, the resulting bytecode also prints the repr of the value of that expression to the standard output(!).

    An if-elif-else chain, a loop with else, and try with its except, else and finally blocks is considered a single statement.

    A source fragment containing 2 top-level statements is an error for the 'single', except in Python 2 there is a bug that sometimes allows multiple toplevel statements in the code; only the first is compiled; the rest are ignored:

    In Python 2.7.8:

    >>> exec(compile('a = 5\na = 6', '<string>', 'single'))
    >>> a
    5

    And in Python 3.4.2:

    >>> exec(compile('a = 5\na = 6', '<string>', 'single'))
    Traceback (most recent call last):
      File "<stdin>", line 1, in <module>
      File "<string>", line 1
        a = 5
            ^
    SyntaxError: multiple statements found while compiling a single statement

    This is very useful for making interactive Python shells. However, the value of the expression is not returned, even if you eval the resulting code.

Thus greatest distinction of exec and eval actually comes from the compile function and its modes.

In addition to compiling source code to bytecode, compile supports compiling abstract syntax trees (parse trees of Python code) into code objects; and source code into abstract syntax trees (the ast.parse is written in Python and just calls compile(source, filename, mode, PyCF_ONLY_AST)); these are used for example for modifying source code on the fly, and also for dynamic code creation, as it is often easier to handle the code as a tree of nodes instead of lines of text in complex cases.

While eval only allows you to evaluate a string that contains a single expression, you can eval a whole statement, or even a whole module that has been compiled into bytecode; that is, with Python 2, print is a statement, and cannot be evalled directly:

>>> eval('for i in range(3): print("Python is cool")')
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  File "<string>", line 1
    for i in range(3): print("Python is cool")
      ^
SyntaxError: invalid syntax

compile it with 'exec' mode into a code object and you can eval it; the eval function will return None.

>>> code = compile('for i in range(3): print("Python is cool")',
                   'foo.py', 'exec')
>>> eval(code)
Python is cool
Python is cool
Python is cool

If one looks into eval and exec source code in CPython 3, this is very evident; they both call PyEval_EvalCode with same arguments, the only difference being that exec explicitly returns None.
Syntax differences of exec between Python 2 and Python 3

One of the major differences in Python 2 is that exec is a statement and eval is a built-in function (both are built-in functions in Python 3). It is a well-known fact that the official syntax of exec in Python 2 is exec code [in globals[, locals]].

Unlike majority of the Python 2-to-3 porting guides seem to suggest, the exec statement in CPython 2 can be also used with syntax that looks exactly like the exec function invocation in Python 3. The reason is that Python 0.9.9 had the exec(code, globals, locals) built-in function! And that built-in function was replaced with exec statement somewhere before Python 1.0 release.

Since it was desirable to not break backwards compatibility with Python 0.9.9, Guido van Rossum added a compatibility hack in 1993: if the code was a tuple of length 2 or 3, and globals and locals were not passed into the exec statement otherwise, the code would be interpreted as if the 2nd and 3rd element of the tuple were the globals and locals respectively. The compatibility hack was not mentioned even in Python 1.4 documentation (the earliest available version online); and thus was not known to many writers of the porting guides and tools, until it was documented again in November 2012:

    The first expression may also be a tuple of length 2 or 3. In this case, the optional parts must be omitted. The form exec(expr, globals) is equivalent to exec expr in globals, while the form exec(expr, globals, locals) is equivalent to exec expr in globals, locals. The tuple form of exec provides compatibility with Python 3, where exec is a function rather than a statement.

Yes, in CPython 2.7 that it is handily referred to as being a forward-compatibility option (why confuse people over that there is a backward compatibility option at all), when it actually had been there for backward-compatibility for two decades.

Thus while exec is a statement in Python 1 and Python 2, and a built-in function in Python 3 and Python 0.9.9,

>>> exec("print(a)", globals(), {'a': 42})
42

has had identical behaviour in possibly every widely released Python version ever; and works in Jython 2.5.2, PyPy 2.3.1 (Python 2.7.6) and IronPython 2.6.1 too (kudos to them following the undocumented behaviour of CPython closely).

What you cannot do in Pythons 1.0 - 2.7 with its compatibility hack, is to store the return value of exec into a variable:

Python 2.7.11+ (default, Apr 17 2016, 14:00:29)
[GCC 5.3.1 20160413] on linux2
Type "help", "copyright", "credits" or "license" for more information.
>>> a = exec('print(42)')
  File "<stdin>", line 1
    a = exec('print(42)')
           ^
SyntaxError: invalid syntax

(which wouldn't be useful in Python 3 either, as exec always returns None), or pass a reference to exec:

>>> call_later(exec, 'print(42)', delay=1000)
  File "<stdin>", line 1
    call_later(exec, 'print(42)', delay=1000)
                  ^
SyntaxError: invalid syntax

Which a pattern that someone might actually have used, though unlikely;

Or use it in a list comprehension:

>>> [exec(i) for i in ['print(42)', 'print(foo)']
  File "<stdin>", line 1
    [exec(i) for i in ['print(42)', 'print(foo)']
        ^
SyntaxError: invalid syntax

which is abuse of list comprehensions (use a for loop instead!).
