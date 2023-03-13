% Estimates the relative tilt of an ABI array based on the behavioral charge
% thresholds 
function tilts = TiltFunc(all_groupcharges,all_IDs,all_ChThMeans);

all_tiltsM = [];
%all_tilts_cell = {};
    for ch = 1:length(all_groupcharges)
        groups = all_groupcharges{ch};
        ID = all_IDs{ch};
        ID = horzcat('ABI',ID(5:end));

        pt_tilts = [];    % initialize tilts list --> [group # i, tilt_deg]
       pt_slopes = [];
        for g = 1:size(groups,1)
            group = groups(g,:); % extracting each electrode group 1-7

            x = 1:3;               % setting up line of fit calculation
            x = x(~isnan(group));
            y = group(~isnan(group));
            p = polyfit(x,y,1);     % p(1) gives slope, p(2) gives y intercept??

            x1 = 1:3; % use if you want x range 1-3
            y1 = polyval(p,x1); %extract y1(2) and y1(4) to get z coords for line


            c(1) = y1(1); % first z coord (line of best fit e1 side)
            c(2) = y1(3); % second z coord (line of best fit e3 side)


            if sum(isnan(group)) < 2
                slope = p(1);              % use if you want higher on right as pos
                tilt_rad = atan(slope);
                tilt_deg = rad2deg(tilt_rad);
                pt_tilts = [pt_tilts;[g,abs(tilt_deg)]]; 
                pt_slopes = [pt_slopes;[abs(slope)]]; 
            end
        end

        ChThMean = all_ChThMeans(ch);
        %all_tilts_cell = {all_tilts_cell,all_tilts};
        tilts(ch).name = all_IDs(ch);
        
        for gg = 1:size(pt_tilts,1)
            tilts(ch).tilt_data(gg).electrode_group_name = pt_tilts(gg,1);
            tilts(ch).tilt_data(gg).tilts = pt_tilts(gg,2);
            tilts(ch).tilt_data(gg).slopes = pt_slopes(gg);
            %Pt_charge_ratios(jj).charge_ratio_data(mm).slopes = pt_slopes(mm);
        end    
        
        all_tiltsM = [all_tiltsM;[pt_tilts]];

    end