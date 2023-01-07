using Term
using Term.LiveWidgets
import Term: load_code_and_highlight
import Term.TermMarkdown: parse_md
using Markdown
import Term.Consoles: console_width

"""
TabViewer allows you to have multiple widget show simultaneously as 
different "tabs". A Menu is used to choose which tab to show
at any given time. 
"""




text = parse_md(
    md"""
# Markdown rendering in Term.jl

This is an example of markdown content rendered in Term.jl.
You can use markdown syntax to make words **bold** and *italic* or insert `literals`.


And, of course, you can show some code too:

```julia
function say_hi(x)
    print("Hellow World")
end
```

---

You can use "quotes" to highlight a section:

> Multi-line quotes can be helpful to make a 
> paragram stand out, so that users won't miss it!
> You can use **other inline syntax** in you `quotes` too.
 
but if you really need to grab someone's attention, use admonitions:

!!! note
    You can use different levels


!!! tip "Wow!"
    Turns out that admonitions can be pretty useful!
    What will you use them for?

---

Of course you can have classic lists:
* item one
* item two
* And a sublist:
    + sub-item one
    + sub-item two


!!! note "Tables"
    You can use the [Markdown table syntax](https://www.markdownguide.org/extended-syntax/#tables)
    to insert tables - Term.jl will convert them to Table object!

| Term | handles | tables|
|:---------- | ---------- |:------------:|
| Row `1`    | Column `2` |              |
| *Row* 2    | **Row** 2  | Column ``3`` |


""",
)


tab_width = console_width()-26  # important for this to be small enough so that we can fit everything


options = ["pager", "input box", "text box", "button"]
tabs = [
    Pager(text; page_lines = 40, title = "Example pager", line_numbers=true, width=tab_width),
    InputBox(; width = tab_width),
    TextWidget("This is just an example text"; width=tab_width),
    Button("Just a button"; 
        pressed_text_style = "bold white", not_pressed_text_style = "red", pressed_background="red",
        width=30, justify=:center)
]

tb = TabViewer(options, tabs)

LiveWidgets.play(tb)


