function [ ENL , DOFs , DOCs ] = assign_BCs(ENL,NoN,PD)


%actual 
DOFs = 0;
DOCs = 0;

for i=1:NoN
    
    for j=1:PD
        
        if (ENL(i,PD+j)==-1)
            
            DOCs=DOCs-1;
            ENL(i,2*PD+j)=DOCs;
        
        else
            
            DOFs = DOFs+1;
            ENL(i,2*PD+j)=DOFs;  
            
        end
        
    end
    
end

for i=1:NoN
    
    for j=1:PD
        
        if (ENL(i,2*PD+j)<0)
            
            ENL(i,3*PD+j) = abs(ENL(i,(2*PD+j))) + DOFs;
        
        else
            
            ENL(i,3*PD+j) = ENL(i,(2*PD+j));    
            
        end
        
    end
    
end

DOCs = abs(DOCs);
end


        
        
    