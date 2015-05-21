[n m]=size(meas)

for i = 1:n,
    media =  median(meas(i,3));
    dist1 = eucdist(meas(i,3),media);
end

gscatter(meas(:,3), meas(:,4), species,'rgb','osd');
xlabel('Comprimento da Petala');
ylabel('Largura da Petala');
hold on

plot (media,'.','color','y');
plot (dist1,'.','color','r');