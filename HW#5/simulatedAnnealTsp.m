function simulatedAnnealTSP(no_cities, temperature_start, cooling_factor)
%
% This function approximates a solution to the Traveling Salesman 
% Problem using the technique of simulated annealing. In this
% technique a set of random tours are evaluated at each iteration.
% The evaluated tour distance is compared to the previous iteration. 
% If the distance is less, it is made the optimal, but if it is 
% more, it is not discarded, but retained with some probability.
% A new random tour is simulated and process repeated.
% A temperature and cooling rate is used to control the number of 
% iterations in the process. As the temperature decreases, the solution
% approaches the optimal. Plots of simulated tour distance and 
% optimal distance vs. iterations, as well as annealing temperature vs.
% iterations is dispalyed, along with the optimal tour.
%
% INPUTS
% no_cities - the no. of cities for which the tour is to be planned.
%             the coordinates of these cities are computed randomly
%
% temperature_start - the starting temperature for the annealing process.
%                     Bigger the value, more the iterations.
%
% cooling_factor - the rate at which the temperature for the process 
%                  decreases. Smaller the value, more the iterations.
%
% OUTPUTS - Plots will be displayed

%% initialization and coordinates generation

cities_mat = unifrnd(0, 1000, no_cities, 2);
% matrix of city coordinates

distance_mat = squareform(pdist(cities_mat)); 
% matrix of intercity distances

temperature = temperature_start;
% process temperature variable

distance_prev = Inf;
% set initial tour distance to infinity

counter = 0;
% iteration counter variable

random_tour = randperm(no_cities);
% create initial tour as a random combination of cities

%% simulated annealing process as long as temperature is positive

while temperature > 1
    
    % below code randomly swaps to cities in the tour. This it the
    % most efficient stochastic method of simulating all possible tours.
    
    tour_position1 = round(unifrnd(1, no_cities)); 
    tour_position2 = round(unifrnd(1, no_cities));
    % randomly select two tour positions from current random tour
    
    swap_city1 = random_tour(tour_position1);
    swap_city2 = random_tour(tour_position2);
    % extract the cities at these random positions
    
    random_tour(tour_position1) = swap_city2;
    random_tour(tour_position2) = swap_city1;
    % swap the cities
    
    tour_distance = 0; 
    % reinitialize the tour distance for each iteration
    
    % calculate the sum of intercity distance along the current random
    % route
    for i = 1 : no_cities - 1
        tour_distance = tour_distance + distance_mat(random_tour(i), random_tour(i + 1));
    end
    
    difference = tour_distance - distance_prev;
    % calculate the differnece between current random tour and previous
    % random tour
    
    % calculate the acceptance probability of the computed tour distance
    % accoridng to exp(-difference/temperature) > rand(0, 1). If either
    % condition below holds true, set the distance as current optimal, and
    % tour as current optimal tour.
    
    if(difference < 0 | exp(-difference / temperature) > rand(0, 1))
        distance_prev = tour_distance;
        optimal_tour = random_tour;
    end
    
    counter = counter + 1;
    % counter variable to track iterations
    
    temperature_vec(counter, :) = temperature;
    % vector tracks annealing temperature at each iteration
    
    temperature = temperature * (1 - cooling_factor);
    % cool the process by discounting temperatuee by cooling factor
    
    optim_distance(counter, :) = distance_prev;
    calc_distance(counter, :) = tour_distance;
    % vectors to store the current optimal distance as well as currently
    % computed distance
end

%% Plot of results

plot(1: 1: counter, temperature_vec, '-', 'Linewidth', 2);
xlabel('Number of Steps');
ylabel('Temperature');
title('Decay of Annealing Temperature');
% plot of annealing temperature vs iterations

figure;
plot(1: 1: counter, optim_distance, '-', 'Linewidth', 2); hold on;
plot(1: 1: counter, calc_distance, '-', 'Linewidth', 2); 
legend;
xlabel('Number of Steps');
ylabel('Distance');
title('Simulated Annealing of Traveling Salesman Problem');
% Plot of calculated distcance and currently optimal distance vs.
% iterations

figure;
scatter(cities_mat(1 : no_cities, 1), cities_mat(1 : no_cities, 2), 'o'); hold on;
plot(cities_mat(optimal_tour, 1), cities_mat(optimal_tour, 2), '-'); grid on;
xlabel('Coordinates');
ylabel('Coordinates');
title('Optimal Tour of Traveling Salesman Problem');
% plot of city coordinates and optimal route