s = tf('s');
sys = (s-1)/((s + 3)*(s + 2)*(s + 1));
rlocus(sys)
%axis([-3 1 -2 2])