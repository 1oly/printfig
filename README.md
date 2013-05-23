printfig
========

I love [matlab2tikz](https://github.com/nschloe/matlab2tikz) and all its functionalities. printfig.m use [matlab2tikz](https://github.com/nschloe/matlab2tikz)
to save any MATLAB figure as a .tex file for easy tweaking or direct compilation with pdflatex.

I'm running Mac 10.8.3 and MATLAB 2012b, I have no idea if printfig.m works on any other platform.

* To use printfig:
1. Make sure printfig.m is in your MATLAB path
2. Add your tex distribution to the /bin/matlab path - see [Andrew Tchieus blog](http://atchieu.wordpress.com/2012/04/08/adding-system-paths-tousing-external-unix-tools-from-the-matlab-command-line/) for instructions.
3. Try to make a figure and compile
```matlab
x = 0:0.01:10;
y = sin(x);
plot(x,y);
figpath = [pwd '/figures'];
printfig([figpath '/myplot.tex'],'4cm','10cm',1)
```
4. Have a look at the `extraAxisOptions` in printfig.m and [matlab2tikz](https://github.com/nschloe/matlab2tikz) to add your own favorite tikz axis options.
