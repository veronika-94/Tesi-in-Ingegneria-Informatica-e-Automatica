clc;

%COSTANTI ENERGIA SOLARE
altezza       = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0.81,2.62,4.43,6.26,8.1,9.94,11.79,13.65,15.51,17.37,19.23,21.1,22.95,24.81,26.66,28.49,30.32,32.14,33.94,35.73,37.49,39.23,40.94,42.62,44.27,45.87,47.43,48.94,50.39,51.77,53.08,54.3,55.44,56.47,57.39,58.18,58.85,59.37,59.74,59.96,60.02,59.93,59.67,59.27,58.71,58.02,57.2,56.25,55.2,54.05,52.8,51.48,50.08,48.62,47.1,45.53,43.92,42.27,40.58,38.86,37.12,35.35,33.57,31.77,29.95,28.12,26.28,24.43,22.58,20.72,18.87,17.01,15.15,13.29,11.44,9.59,7.75,5.92,4.1,2.29,0.5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
azimut        = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,74.76,76.41,78.06,79.69,81.32,82.95,84.58,86.21,87.86,89.51,91.18,92.88,94.59,96.34,98.12,99.94,101.81,103.73,105.7,107.74,109.85,112.05,114.33,116.72,119.21,121.83,124.58,127.47,130.51,133.73,137.12,140.7,144.46,148.43,152.58,156.92,161.43,166.09,170.86,175.71,180.61,185.49,190.33,195.08,199.71,204.18,208.48,212.59,216.52,220.24,223.78,227.13,230.31,233.32,236.18,238.9,241.49,243.96,246.32,248.58,250.76,252.86,254.89,256.85,258.76,260.61,262.43,264.2,265.94,267.66,269.35,271.02,272.67,274.31,275.95,277.58,279.21,280.84,282.48,284.13,285.79,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
irraggiamento = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
sfasamento = -180;
rend_sol = 0.2;
sup_pann = 1.5;
N_pann = 10;


%COSTANTI ENERGIA EOLICA
vel_vento = [1.3, 1.4, 1.5, 1.7, 1.2, 2.0, 2.1, 1.8, 1.7, 1.5, 1.9, 2.0, 2.2, 2.1, 1.9, 1.7, 1.9, 2.1, 2.2, 2.0, 2.3, 2.1, 2.0, 1.9, 2.1, 2.4, 2.2, 2.2, 2.1, 1.9, 1.5, 1.3, 1.1, 0.9, 1.0, 0.7, 0.8, 0.9, 0.6, 0.9, 1.0, 1.1, 1.2, 1.3, 1.4, 1.2, 1.2, 1.0, 1.2, 1.3, 1.1, 1.5, 1.6, 1.5, 1.4, 1.6, 1.5, 1.3, 1.3, 1.4, 1.2, 1.3, 1.5, 1.6, 1.8, 1.7, 1.7, 1.6, 1.5, 1.6, 1.8, 1.6, 1.5, 1.5, 1.4, 1.3, 1.5, 1.8, 2.1, 2.6, 2.4, 2.5, 2.6, 2.1, 2.0, 1.6, 1.4, 1.2, 1.0, 1.7, 1.6, 0.5, 1.2, 1.8, 2.1, 1.9, 1.6, 1.5, 1.6, 1.4, 1.5, 1.6, 1.8, 2.0, 2.1, 1.9, 2.0, 2.3, 2.5, 2.6, 2.4, 2.1, 2.0, 1.6, 1.2, 1.0, 1.2, 1.4, 1.5, 1.8, 2.4, 2.6, 2.1, 1.8, 1.5, 1.7, 1.3, 1.5, 1.1, 0.7, 0.5, 0.7, 1.8, 1.0, 1.6, 1.8, 2.0, 1.6, 1.2, 1.0, 1.5, 1.8, 2.0, 2.1];
l_pale = 10;
area = pi*l_pale^2/4;
densita = 1.225;
Cp = 0.22;
N_pale = 4;

%COSTANTI ENERGIA FORNITA
fornitura = 3000;


%DEFINIZIONE UTENZE
lavatrice      = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
forno          = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
frigorifero    = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1];
condizionatori = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0];
televisore     = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0];
lavastoviglie  = [1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1];
asciugacapelli = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1];
stereo_dvd     = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0];
computer       = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1];
microonde      = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
scaldabagno    = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1];
luci           = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1];
console        = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0];
ricariche_cell = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1];

utenze = [lavatrice; forno; frigorifero; condizionatori; televisore; lavastoviglie; asciugacapelli; stereo_dvd; computer; microonde; scaldabagno; luci; console; ricariche_cell];

POS = [1:144];

num_utenze = 14;

pot_lav = 2100;
pot_forno = 1500;
pot_frigo = 25;
pot_cond = 50;
pot_tel = 55;
N_tel = 3;
pot_lavast = 670;
pot_asciu = 2000;
pot_ste = 150;
pot_comp = 150;
N_comp = 3;
pot_micro = 800;
pot_scald = 1500;
pot_luci = 5;
N_luci = 8;
pot_cons = 250;
pot_ric = 3;
N_cell = 5;

%potenze = [pot_lav; pot_forno; pot_frigo; pot_cond; pot_tel; pot_lavast; pot_asciu; pot_ste;];

%priorità è una matrice con un contatore sulla prima colonna e gli indici
%di riga delle utenze prese nell'ordine in cui sono state definitte sopra
priorita = [0 13;0 8;0 5;0 9;0 7;0 10;0 14;0 1;0 6; 0 11;0 2;0 4;0 12;0 3];

%disp(priorita);


simOut = sim('CUD_10m', 'SimulationMode','normal','AbsTol','1e-5',...
            'SaveState','on','StateSaveName','xout',...
            'SaveOutput','on','OutputSaveName','yout',...
 'SaveFormat', 'Dataset');
simOut.getSimulationMetadata.ModelInfo;
outputs = simOut.get('yout');

%x1=(outputs.get('bilanciamento').Values);
x2=(outputs.get('energia_totale').Values);
x3=(outputs.get('energia_necessaria').Values);
%plot(x1); hold on;

time_min = x2.Time*10/60;
assex = minutes(10):minutes(10):hours(24);
plot(assex, x2.Data, 'DurationTickFormat','hh:mm', 'LineWidth', 1.5, 'Color', '#FF6600'); hold on;
plot(assex, x3.Data, 'DurationTickFormat','hh:mm', 'LineWidth', 1.5, 'Color', 'blue'); hold on;
title('BILANCIAMENTO ENERGETICO');
xlabel('Time [hh:mm]'); 
ylabel('Energy [W]')
%legend('Energia Prodotta', 'Energia Richiesta');

tempo2 = x2.Time;
disp(tempo2);
en_tot = x2.Data;
disp(en_tot);

tempo3 = x3.Time;
disp(tempo3);
en_nec = x3.Data;
disp(en_nec);

s_out = "";

soglia=300;  


val = en_tot-soglia;
disp("inizio " + string(val) + " fine");




d = 0;
cont=0;

while (d == 0)
    
    disp("entrato nel primo while")
    
    %en_tot=en_tot-soglia;

    for tt=1:144
        
        t=tt-3;
    
            %if (en_nec(t) < (en_tot(t)-soglia)) 
                
                disp("t=" + string(t))
                
                disp(string(en_nec(t+3))+ " " +string(en_tot(t+3)-soglia))
                

                while (en_nec(t+3) >= (en_tot(t+3)-soglia))
                    
                    disp("entrato nel secondo while")
            
                    for prio=1:num_utenze
                        
                        if prio < 10
                            
                            disp("prio<10")
                
                            if utenze(priorita(prio,2),t+3)==1
                                
                                disp("utenze:" + string(priorita(prio,2) + "==1 a t+3"))
                    
                                s_out = s_out+" tempo: "+string(t+3)+" utenza: "+string(priorita(prio,2))+newline;
                            
                                if priorita(prio,1)==3
                                    
                                    disp("contatore=3 e prio<9, sposto")
                            
                                    %slittamento utenza
                                    ut=utenze(priorita(prio,2),:);
                    
                                    ut(POS+3)=ut(POS);
                    
                                    ss=size(ut);
                    
                                    ut(1:3)=ut(ss(2)-2:ss(2));
                    
                                    ut(ss(2)-2:ss(2))=[];
                    
                                    utenze(priorita(prio,2),:)=ut;
                            
                                    %fine slittamento utenza
                    
                                    priorita(prio,1) = 0; 
                                
                                    spostare = priorita(prio,:);
                                            
                                    %disp(spostare);
                                    priorita(prio,:) = priorita(prio+1,:);
                                    priorita(prio+1,:)=spostare;
                                
                                
                                
                                end
                            
                                if priorita(prio,1)<3
                                    
                                    disp("contatore<3 e prio<9, non sposto")
                                
                                    %slittamento utenza
                                    ut=utenze(priorita(prio,2),:);
                    
                                    ut(POS+3)=ut(POS);
                    
                                    ss=size(ut);
                    
                                    ut(1:3)=ut(ss(2)-2:ss(2));
                    
                                    ut(ss(2)-2:ss(2))=[];
                    
                                    utenze(priorita(prio,2),:)=ut;
                            
                                    %fine slittamento utenza
                    
                                    priorita(prio,1) = priorita(prio,1) + 1; 
                                
                                end
                                
                                lavatrice = utenze(1,:);
                                %disp(lavatrice);
                                forno = utenze(2,:);
                                frigorifero = utenze(3,:);   
                                condizionatori = utenze(4,:);
                                televisore = utenze(5,:);           
                                lavastoviglie = utenze(6,:);
                                asciugacapelli = utenze(7,:);
                                stereo_dvd = utenze(8,:);
                                computer = utenze(9,:);
                                microonde = utenze(10,:);
                                scaldabagno = utenze(11,:);
                                luci = utenze(12,:);
                                console = utenze(13,:);
                                ricariche_cell = utenze(14,:);

                                simOut = sim('CUD_10m', 'SimulationMode','normal','AbsTol','1e-5',...
                                        'SaveState','on','StateSaveName','xout',...
                                        'SaveOutput','on','OutputSaveName','yout',...
                                        'SaveFormat', 'Dataset');
                                simOut.getSimulationMetadata.ModelInfo;
                                outputs = simOut.get('yout');

                                %x1=(outputs.get('bilanciamento').Values);
                                x2=(outputs.get('energia_totale').Values);
                                x3=(outputs.get('energia_necessaria').Values);
                                %plot(x1); hold on;
                                %plot(x2); hold on;
                                %plot(x3);
                                %title('BILANCIAMENTO ENERGETICO');
                                %xlabel('Time'); legend('x2', 'x3');

                                tempo2 = x2.Time;
                                %disp(tempo2);
                                en_tot = x2.Data;
                                %disp(en_tot);

                                tempo3 = x3.Time;
                                %disp(tempo3);
                                en_nec = x3.Data;
                                %disp(en_nec);
                                
                                disp("ho rifatto la simulazione per prio<9")
                            
                    
                            end
                
                            if (en_nec(t+3) < (en_tot(t+3)-soglia))
                                
                                disp("en_nec a t+3 < en_tot a t+3")
                    
                                break
                    
                            end
                                   
                        end
                        
                        if(prio == 10)
                            
                            disp("prio = 10, ultima utenza da spostare")
                            
                            
                            if utenze(priorita(prio,2),t+3)==1
                                
                                disp("utenze:" + string(priorita(prio,2) + "==1 a t+3"))
                    
                                s_out = s_out+" tempo: "+string(t+3)+" utenza: "+string(priorita(prio,2))+newline;
                            
                                if priorita(prio,1)==3
                                    
                                    disp("conattore = 3 e prio =9, non sposto")
                            
                                    %slittamento utenza
                                    ut=utenze(priorita(prio,2),:);
                    
                                    ut(POS+3)=ut(POS);
                    
                                    ss=size(ut);
                    
                                    ut(1:3)=ut(ss(2)-2:ss(2));
                    
                                    ut(ss(2)-2:ss(2))=[];
                    
                                    utenze(priorita(prio,2),:)=ut;
                            
                                    %fine slittamento utenza
                    
                                    priorita(prio,1) = 0; 
                                
                                    
                                    %spostare = priorita(prio,:);
                                            
                                    %disp(spostare);
                                    %priorita(prio,:) = priorita(prio+1,:);
                                    %priorita(prio+1,:)=spostare;
               
                                   
                                
                                
                                
                                end
                            
                                if priorita(prio,1)<3
                                    
                                    disp("contatore < 3 e prio =9, ugualmente non sposto")
                                
                                    %slittamento utenza
                                    ut=utenze(priorita(prio,2),:);
                    
                                    ut(POS+3)=ut(POS);
                    
                                    ss=size(ut);
                    
                                    ut(1:3)=ut(ss(2)-2:ss(2));
                    
                                    ut(ss(2)-2:ss(2))=[];
                    
                                    utenze(priorita(prio,2),:)=ut;
                            
                                    %fine slittamento utenza
                    
                                    priorita(prio,1) = priorita(prio,1) + 1; 
                                
                                end
                                
                                lavatrice = utenze(1,:);
                                %disp(lavatrice);
                                forno = utenze(2,:);
                                frigorifero = utenze(3,:);   
                                condizionatori = utenze(4,:);
                                televisore = utenze(5,:);           
                                lavastoviglie = utenze(6,:);
                                asciugacapelli = utenze(7,:);
                                stereo_dvd = utenze(8,:);
                                computer = utenze(9,:);
                                microonde = utenze(10,:);
                                scaldabagno = utenze(11,:);
                                luci = utenze(12,:);
                                console = utenze(13,:);
                                ricariche_cell = utenze(14,:);

                                simOut = sim('CUD_10m', 'SimulationMode','normal','AbsTol','1e-5',...
                                        'SaveState','on','StateSaveName','xout',...
                                        'SaveOutput','on','OutputSaveName','yout',...
                                        'SaveFormat', 'Dataset');
                                simOut.getSimulationMetadata.ModelInfo;
                                outputs = simOut.get('yout');

                                %x1=(outputs.get('bilanciamento').Values);
                                x2=(outputs.get('energia_totale').Values);
                                x3=(outputs.get('energia_necessaria').Values);
                                %plot(x1); hold on;
                                %plot(x2); hold on;
                                %plot(x3);
                                %title('BILANCIAMENTO ENERGETICO');
                                %xlabel('Time'); legend('x2', 'x3');

                                tempo2 = x2.Time;
                                %disp(tempo2);
                                en_tot = x2.Data;
                                %disp(en_tot);

                                tempo3 = x3.Time;
                                %disp(tempo3);
                                en_nec = x3.Data;
                                %disp(en_nec);
                                
                                disp("ho rifatto la sumulazione per prio=9")
                            
                    
                            end
                
                            if (en_nec(t+3) < (en_tot(t+3)-soglia))
                                
                                disp("en_nec a t+3 < en_tot a t+3")
                    
                                break
                    
                            end
                            
                            
                                
                        end
                        
                        if (prio > 10)
                            
                            disp("prio >10, non devo spostare nulla")
                            
                            break
                            
                        end
                    end
                
                end 
    
    end
    
    
    
    dd = en_nec <= (en_tot-soglia);
    d = prod(dd);
    
    cont= cont+1;
    %{
    disp(dd);
    if cont==4
       break 
    end
    %}
    
end

%disp(utenze);

%plot(assex, x2.Data,'DurationTickFormat','mm:ss'); hold on;
plot(assex, x3.Data,'DurationTickFormat','hh:mm', 'LineWidth', 1.5, 'Color', 'cyan');
legend('Energia Prodotta', 'Energia Richiesta', 'Energia Consumata');



disp(s_out);
disp("Ho ciclato " + cont + " volte")

