function post_process(NL , EL , ENL , E , Node_flag , Element_flag , mag)
NoN = size(NL,1)
NoE = size(EL,1)

hold 'on'

for i = 1 : NoE
    H=plot([NL(EL(i,1),1),NL(EL(i,2),1)] , [NL(EL(i,1),2),NL(EL(i,2),2)],'Linewidth', 3, 'Color', 'k');
    H.Color(4)=0.2
end

for i = 1 :NoN
    plot(NL(i,1),NL(i,2),'o','MarkerSize',20,'MarkerEdgeColor', 'k', 'MarkerFaceColor','r')
end

colorMap = jet;
colormap(colorMap);

for i = 1:NoE
    x = [ENL(EL(i,1),1)+mag*ENL(EL(i,1),9) ENL(EL(i,2),1)+mag*ENL(EL(i,2),9)];
    y = [ENL(EL(i,1),2)+mag*ENL(EL(i,1),10) ENL(EL(i,2),2)+mag*ENL(EL(i,2),10)];
    z= zeros(size(x));
    sigma=E*(sqrt((ENL(EL(i,1),9)-ENL(EL(i,2),9))^2 + (ENL(EL(i,1),10)-ENL(EL(i,2),10))^2)...
        / (sqrt((ENL(EL(i,1),1)-ENL(EL(i,2),1))^2 + (ENL(EL(i,2),2))^2)));
    col= [sigma sigma]
    figure(1)
    surface([x;x],[y;y],[z;z],[col;col],'facecol','no','edgecol','interp','linew',4);
end
axis equal
colorbar

%elements
if isequal(Element_flag,'on')
    for i = 1 : NoE
        text((ENL(EL(i,1),1)+mag*ENL(EL(i,1),9)+ENL(EL(i,2),1)+mag*ENL(EL(i,2),9))/2,(ENL(EL(i,1),2)+mag*ENL(EL(i,1),10)+ENL(EL(i,2),2)+mag*ENL(EL(i,2),10))/2,num2str(i),'Color','k','FontSize',16,'HorizontalAlignment','center')
    end
end

%nodes
for i =1 : NoN
    plot(ENL(i,1)+mag*ENL(i,9),ENL(i,2)+mag*ENL(i,10),'o','MArkerSize',16, 'MarkerEdgeColor','k','MarkerFaceColor',[0,0.7,0.9])
end

%node numbers
if isequal(Node_flag, 'on')
    for i = 1:NoN
        text (ENL(i,1)+mag*ENL(i,9), ENL(i,2)+mag*ENL(i,10),num2str(i),'Color','w','FontSize',12,'HorizontalAlignment','center')
    end
end
hold off
end

