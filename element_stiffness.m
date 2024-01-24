function k = element_stiffness( nl, ENL, E, A)

X(1) = ENL(nl(1),1);
Y(1) = ENL(nl(1),2);
X(2) = ENL(nl(2),1);
Y(2) = ENL(nl(2),2);

L = sqrt( (X(1)-X(2))^2 + (Y(1)-Y(2))^2)

C = (X(2)-X(1))/L;
S = (Y(2)-Y(1))/L;

k = (A*E/L) * [ C^2 C*S  -C^2 -C*S
                C*S S^2  -C*S -S^2
               -C^2 -C*S  C^2  C*S
               -C*S -S^2  C*S  S^2]
end