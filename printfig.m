function printfig(dest,h,w,compile,polar)
% Use matlab2tikz to compile a .tex tikz-figure and optionally show pdf.
%
% Usage: printfig([figpath '/fig_name.tex'],'height','width',1,0)
% Input:
%	dest: String specifying destination and name of figure, e.g 'myfigure.tex'
%	h: String with height of figure, e.g. '4cm'
%	w: String with width of figure, e.g. '4cm'
%	compile: Logical (1 or 0) option to compile with pdflatex
%   polar: Logical (1 or 0) option to get better polar plots
%	Author: Oliver Lylloff
%	Date: 24/5/13
%	
if nargin == 4
    polar = false;
elseif nargin == 5 && polar == 1
    polar = true;
end
matlab2tikz(dest,'height', h, 'width',w,...
'parseStrings',false,...
'colormap',colormap(fireprint),...
'showHiddenStrings',polar,...
'extraAxisOptions', {...
'scaled x ticks = false',...
'/pgf/number format/set thousands separator={}'...
},'standalone',true);
if compile
	setenv('texvar',dest);
	[pathstr, name, ext] = fileparts(dest);
	setenv('var',pathstr);
	system('pdflatex -output-directory $var $texvar');
	system('rm -f $var/*.aux');
	system('rm -f $var/*.log');
	setenv('pdfvar',[pathstr '/' name '.pdf']);
	system('open $pdfvar');
end
end