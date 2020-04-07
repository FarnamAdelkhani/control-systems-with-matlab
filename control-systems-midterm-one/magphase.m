s = j;
z = (s/(s^2 + s + 1));
M = abs(z)    %magnitude
Ph = angle(z) %phase angle
%Ph2 = atan2(imag(z),real(z)) %phase angle
angleInDegrees = radtodeg(Ph);