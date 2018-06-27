

% ----------------------------------------------------
% Setup mpost for eps generation
% ----------------------------------------------------

prologues := 3;

verbatimtex
    %&latex
    \documentclass[11pt]{article}
    \usepackage{siunitx}
    \usepackage[euler-hat-accent,small]{eulervm}
    \begin{document}
    etex

    input TEX;
TEXPRE("%&latex" & char(10) & "\documentclass[11pt]{article}" & char(10) &
    "\usepackage{siunitx}" & char(10) & 
    "\usepackage[euler-hat-accent,small]{eulervm}" & char(10) &
"\begin{document}");
	     TEXPOST("\end{document}");


% ----------------------------------------------------
% Name of output files 
% ----------------------------------------------------

    if scantokens(mpversion) < 1.200:
      filenametemplate
    else:
	outputtemplate :=
    fi
"%j-%c.mps";

% ----------------------------------------------------
% Global length scale
% ----------------------------------------------------

	numeric u; 
    u := 5bp;


% 
% Bullets.
%
	pen bullet_pen;     bullet_pen := pencircle scaled 4bp;
	color bullet_in;    bullet_in  := black; 
	color bullet_out;   bullet_out := 2 * (0.4, 0.4, 0.4);



% ----------------------------------------------------
% Drawing car 
% ----------------------------------------------------
% Figures from MetaPost manual, by John Hobby.  Thank you Hobby!

	picture wheel, car;
	path body;
	% Use a calligraphic pen.
	pickup pencircle scaled .1u yscaled .6 rotated 30;
	% Define a wheel object.
	wheel := image(
	    draw fullcircle scaled 2u xscaled .8 rotated 30;
	draw fullcircle scaled .1u xscaled .8 rotated 30
	    withpen currentpen scaled .5;
	);
	% Construct path for car body.
	body := (3.2u,0){right}..(4.5u,1.5u){up}..(1.5u,2.5u){dir(-170)}
	    ..(1.5u,4.25u){up}...(0,5u){left};
	    body := body .. reverse body reflectedabout (origin, (0,u));
	% Define a car object.
	car := image(
	    draw wheel shifted (2u, 0);% Draw two wheels.
	    draw wheel shifted (-2u, 0);
	draw (-.8u,0){dir(5)}..(.8u,0);% Draw connection betweeen wheels.
	    draw body;% Draw body.
	    % Draw speed indicators.
	    for i=1.5, 2, 2.5:
       draw (5u, u*i){right}..{dir(-10)}(6.5u,u*i*.95);
     endfor
	    ) shifted (0, u) slanted -.2 rotated 1;% Introduce asymmetries.
       % Draw two cars and a faster one.
beginfig(0)
     draw car shifted (5u,0);
draw car shifted (20u,0);
draw car slanted -.35 shifted (45u,0);
     % Draw motorway.
     draw (-5u,-u)...(25u,-.5u)...(60u,-u)
	 withpen currentpen scaled 4 withcolor .7white;
endfig;

% ----------------------------------------------------
% My car
% ----------------------------------------------------

     picture lcar;
	 lcar := image(
	     draw wheel shifted (2u, 0);% Draw two wheels.
     draw wheel shifted (-2u, 0);
	 draw (-.8u,0){dir(5)}..(.8u,0);% Draw connection betweeen wheels.
	     draw body;% Draw body.
     % Draw speed indicators.
     for i=1.5, 2, 2.5:
       draw (5u, u*i){right}..{dir(-10)}(6.5u,u*i*.95);
     endfor
     )reflectedabout(origin,(0,u)) shifted (0, u) slanted +.3 rotated -1;% Introduce asymmetries.
path road;      % motorway
road   := (-5u,-u)...(25u,-.5u)...(60u,-u);
    color carA;
    color carB;
    carA := (.9,.6,0);
    carB := (.5,.3,0);

beginfig(1)

     pair autoA; autoA := (2*u,0);
pair autoB; autoB := (30*u,0);
     numeric roadscale; roadscale :=0.9;

     draw lcar slanted .3 shifted autoA withcolor (.255,.41,.844);
%draw lcar slanted .6 shifted autoB withcolor (.255,.41,.844);
     %(.9,.6,0); %orange

     % Draw motorway.
     draw (road   scaled roadscale) \
	 withpen currentpen scaled 4 withcolor .7white;

     %label.lft(btex $x_{a}$ etex, (-5u,-u) );
     % Indicatori di posizione delle auto sulla strada
     %pair PA ; 
     %PA := (road scaled roadscale) 
     %	 intersectionpoint ((xpart autoA, -u) -- (xpart autoA, u));
     %pair PB ;
     %PB := (road scaled roadscale) 
%	 intersectionpoint ((xpart autoB, -u) -- (xpart autoB, u));
%	 draw PA withpen bullet_pen withcolor carB;
%     draw PB withpen bullet_pen withcolor carB;
%	 %label.llft(btex $x_{a}$ etex, (xA*u, hA-u)); 
%	 %label.llft(btex $x_{b}$ etex, (xB*u, hB-u)); 
%
%	 label.bot(btex $x(t)$ etex, PA );
%	 label.bot(btex $x(t+\Delta t )$ etex, PB );

	 %


endfig;

beginfig(2)

     pair autoA; autoA := (2*u,0);
pair autoB; autoB := (8*u,0);
pair autoC; autoC := (14*u,0);
pair autoD; autoD := (20*u,0);
pair autoE; autoE := (26*u,0);
     numeric roadscale; roadscale :=0.9;

     draw lcar slanted .3 shifted autoA withcolor (.255,.41,.844);
     draw lcar slanted .6 shifted autoB withcolor (.9,.6,0);
     draw lcar slanted .9 shifted autoC withcolor (.9,.6,0);
     draw lcar slanted .3 shifted autoD withcolor (.9,.6,0);
     draw lcar slanted .6 shifted autoE withcolor (.9,.6,0);
     %(.9,.6,0); %orange

     % Draw motorway.
     draw (road   scaled roadscale) \
	 withpen currentpen scaled 4 withcolor .7white;

     %label.lft(btex $x_{a}$ etex, (-5u,-u) );
     % Indicatori di posizione delle auto sulla strada
     %pair PA ; 
     %PA := (road scaled roadscale) 
     %	 intersectionpoint ((xpart autoA, -u) -- (xpart autoA, u));
     %pair PB ;
     %PB := (road scaled roadscale) 
%	 intersectionpoint ((xpart autoB, -u) -- (xpart autoB, u));
%	 draw PA withpen bullet_pen withcolor carB;
%     draw PB withpen bullet_pen withcolor carB;
%	 %label.llft(btex $x_{a}$ etex, (xA*u, hA-u)); 
%	 %label.llft(btex $x_{b}$ etex, (xB*u, hB-u)); 
%
%	 label.bot(btex $x(t)$ etex, PA );
%	 label.bot(btex $x(t+\Delta t )$ etex, PB );

	 %


endfig;





     end;
     end;


