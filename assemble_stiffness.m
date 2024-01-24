function [K] = assemble_stiffness( ENL, EL, NL, E, A)

NoE = size(EL,1);
NPE = size(EL,2);

NoN = size(NL,1);
PD = size(NL,2);

K=zeros(NoN*PD,NoN*PD);

for i=1:NoE
    
    nl = EL(i,1:NPE);
    
    k = element_stiffness(nl,ENL,E,A);
    
    for r=1:NPE
        
        for p=1:PD
            
            for q=1:NPE
                
                for s=1:PD
                    
                    row = ENL(nl(r) , p+3*PD);
                    column = ENL(nl(q) , s+3*PD);
                    value = k( (r-1)*PD+p , (q-1)*PD+s );
                    
                    K(row,column) = K(row,column) + value;
                    
                    
                end
            end
        end
    end
end


