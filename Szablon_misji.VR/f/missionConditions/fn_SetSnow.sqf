//creates random snowfall around player

private ["_snowSparse","_snowLight","_snowMedium","_snowHeavy","_snowStorm","_rSnow"];

"colorCorrections" ppEffectAdjust [1, 1, 0, [0.01, 0.02, 0.04, 0.01], [0.87, 1.08, 1.196, 0.3], [0.399, 0.287, 0.014, 0.0]]; 
"colorCorrections" ppEffectCommit 0; 
"colorCorrections" ppEffectEnable TRUE;



while {true} do {

	_rSnow = [2,5] call BIS_fnc_randomInt;
	
	switch (5) do {
	
		case 1 : {
				_snowSparse = "#particleSource" createVehicleLocal (position player);  
				_snowSparse setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal", 16,12,13,1], "","Billboard", 1, 7, [0,0,0], [0,0,0], 1, 0.0000001, 0.000, 1.7,[0.07],[[1,1,1,1]],[0,1], 0.2, 1.2, "", "",vehicle player];
				_snowSparse setParticleRandom [0,[30,30,20],[0,0,0],0,0.01,[0,0,0,0.1],0,0];
				_snowSparse setParticleCircle [0,[0,0,0]];
				_snowSparse setDropInterval 0.1; // 0.0001 more zeros is more snow
				//_snowSparse setDropInterval 0.1; // 0.0001 more zeros is more snow
				};
	
		case 2 : {
				_snowLight = "#particleSource" createVehicleLocal (position player);  
				_snowLight setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal", 16,12,13,1], "","Billboard", 1, 7, [0,0,0], [0,0,0], 1, 0.0000001, 0.000, 1.7,[0.07],[[1,1,1,1]],[0,1], 0.2, 1.2, "", "",vehicle player];
				_snowLight setParticleRandom [0,[30,30,20],[0,0,0],0,0.01,[0,0,0,0.1],0,0];
				_snowLight setParticleCircle [0,[0,0,0]];
				_snowLight setDropInterval 0.001; // 0.0001 more zeros is more snow
				};
		case 3 : {
				_snowMedium = "#particleSource" createVehicleLocal (position player);  
				_snowMedium setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal", 16,12,13,1], "","Billboard", 1, 7, [0,0,0], [0,0,0], 1, 0.0000001, 0.000, 1.7,[0.07],[[1,1,1,1]],[0,1], 0.2, 1.2, "", "",vehicle player];
				_snowMedium setParticleRandom [0,[30,30,20],[0,0,0],0,0.01,[0,0,0,0.1],0,0];
				_snowMedium setParticleCircle [0,[0,0,0]];
				_snowMedium setDropInterval 0.0001; // 0.0001 more zeros is more snow
				};
		case 4 : {
				_snowHeavy = "#particleSource" createVehicleLocal (position player);  
				_snowHeavy setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal", 16,12,13,1], "","Billboard", 1, 7, [0,0,0], [0,0,0], 1, 0.0000001, 0.000, 1.7,[0.07],[[1,1,1,1]],[0,1], 0.2, 1.2, "", "",vehicle player];
				_snowHeavy setParticleRandom [0,[30,30,20],[0,0,0],0,0.01,[0,0,0,0.1],0,0];
				_snowHeavy setParticleCircle [0,[0,0,0]];
				_snowHeavy setDropInterval 0.00001; // 0.0001 more zeros is more snow
				};
		case 5 : {
				_snowStorm = "#particleSource" createVehicleLocal (position player);  
				_snowStorm setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal", 16,12,13,1], "","Billboard", 1, 7, [0,0,0], [0,0,0], 1, 0.0000001, 0.000, 1.7,[0.07],[[1,1,1,1]],[0,1], 0.2, 1.2, "", "",vehicle player];
				_snowStorm setParticleRandom [5,[30,30,20],[0,0,0],0,0.1,[0,0,0,0.1],1,1];
				//_snowStorm setParticleRandom [5,[30,30,20],[0,0,0],0,0.01,[0,0,0,0.1],0,0];
				_snowStorm setParticleCircle [0,[0,0,0]];
				_snowStorm setDropInterval 0.000000001 + random 0.001; // 0.0001 more zeros is more snow
				//_snowStorm setDropInterval 0.000001; // 0.0001 more zeros is more snow
				};		
	};    								   //[5, [25, 25, 5], [vitx, vity, -1], 0, 0.1, [0, 0, 0, 0.1], 1, 1];

sleep 5; + (random 1800);

//deleteVehicle _snowSparse;
deleteVehicle _snowLight;
deleteVehicle _snowMedium;
deleteVehicle _snowHeavy;
deleteVehicle _snowStorm;

	//add random 5% possible no snow interval
	if (random 1 <= 0.05) then {
		sleep 1 + (random 1200);
	};
};






