printfig
========

I love [matlab2tikz](https://github.com/nschloe/matlab2tikz) and all its functionalities. printfig.m use [matlab2tikz](https://github.com/nschloe/matlab2tikz)
to save any MATLAB figure as a .tex file (using the standalone document class) for easy tweaking or direct compilation with pdflatex.

With this you quickly get great looking pdf figures compiled with pdflatex.

DISCLAIMER: I'm running Mac 10.8.3 and MATLAB 2012b, I have no idea if printfig.m works on any other platform. However, the implementation is very simple (20 lines of code or so)
so it should be easy to migrate to any other system.

Note: If you've succeded in migrating to other systems please let me know and I'll link to your code.

####To use printfig:
1. Make sure you have printfig.m and [matlab2tikz](https://github.com/nschloe/matlab2tikz) in your MATLAB path.
2. Add your tex distribution to the /bin/matlab path - see [Andrew Tchieus blog](http://atchieu.wordpress.com/2012/04/08/adding-system-paths-tousing-external-unix-tools-from-the-matlab-command-line/) for instructions.
If you have a standard TeX Live 2012 distribution it's probably something like 

      `export PATH="$PATH:/usr/local/texlive/2012/bin/universal-darwin"`

3. Try to make a figure and compile

      ```matlab
      x = 0:0.01:10;
      y = sin(x);
      plot(x,y);
      figpath = [pwd '/figures'];         % Provided /figures exist
      printfig([figpath '/myplot.tex'],'4cm','10cm',1);
      ```
4. Have a look at the `extraAxisOptions` in printfig.m, [matlab2tikz](https://github.com/nschloe/matlab2tikz) and [PGFPlots](http://pgfplots.sourceforge.net) to add your own favorite pgf axis options.
