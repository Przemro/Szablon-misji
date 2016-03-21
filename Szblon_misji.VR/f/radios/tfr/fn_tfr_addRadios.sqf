// F3 - Add TFR Radios Function
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// DECLARE VARIABLES

private["_unit", "_typeOfUnit", "_longRange","_radio1","_radio2","_radio3", "_backpackItems"];

_unit = player;

_typeOfUnit = _unit getVariable ["f_var_assignGear", "NIL"];

// DEFINE THE RADIOS THAT WILL BE USED

switch ((side player)) do { //longrange, shortrange, rifradio
    case (west): {
      _radio1 = "tf_rt1523g_big_rhs";
      //_radio1 = "UK3CB_BAF_B_Bergen_MTP_JTAC_H_A";  		//radio dla jednostek BAF
      //_radio1 = "tf_rt1523g_big_bwmod";  					//radio dla jednostek Bundeswery Woodland
	  //_radio1 = "tf_rt1523g_big_bwmod_tropen";  			//radio dla jednostek Bundeswery Desert
      //_radio1 = "tf_rt1523g_big_bwmod";  					//radio dla jednostek PSZ LAS [najlepiej pasuje]
      //_radio1 = "tf_rt1523g_sage";  						//radio dla jednostek USMC Woodland 80/90
	  //_radio1 = "tf_rt1523g_big_bwmod"					//radio dla jednostek USMC Woodland 2010
      
      _radio2 = TF_defaultWestPersonalRadio;
      _radio3 = TF_defaultWestRiflemanRadio;};
    case (east): {
      _radio1 = "tf_mr3000_rhs";
      _radio2 = TF_defaultEastPersonalRadio;
      _radio3 = TF_defaultEastRiflemanRadio;};
    default {
      _radio1 = "tf_anprc155_coyote";
      _radio2 = TF_defaultGuerPersonalRadio;
      _radio3 = TF_defaultGuerRiflemanRadio;};
};

// ====================================================================================

// ASSIGN RADIOS TO UNITS
// Depending on the loadout used in the assignGear component, each unit is assigned
// a set of radios.

if(_typeOfUnit != "NIL") then {

  // If radios are enabled in the settings
  if(!f_radios_settings_tfr_disableRadios) then {


      // Set the list of units that get a rifleman's radio
      _rifradio = ["ar","aar","rat","samag","mmgag","hmgag","matag","hatag","mtrag","sp","r","smg","gren","msamag","hsamag","pc","m","samg","mmgg","matg","hmgg","hatg","sn","mtrg","vg","vd","pcc","hsamg","msamg"];

      // Set the list of units that get a shortrange radio
      _shortrange = ["co","dc","ftl","uav","vc","divc","divr","divs","divm","car","ps"];

      // Give out respective radios

      if (_typeOfUnit in _rifradio) then {
        _unit linkItem _radio3;
      } else {
        if (_typeOfUnit in _shortrange) then {
          _unit linkItem _radio2;
        };
      };

      // Special cases
      _specialist = ["vc", "pp", "eng", "engm","uav","dm"];

      // If unit is leader of group and in the above list, give SR. Else, give them
      // a rifleman's radio.

      if (_typeOfUnit in _specialist) then {
        if (_unit == (leader (group _unit))) then {
          _unit linkItem _radio2;
        } else {
          _unit linkItem _radio3;
        };
      };

      // Give out LR backpacks according to f\radios\tfr_settings.sqf.
      if(f_radios_settings_tfr_defaultLRBackpacks) then {
        if (_unit == (leader (group _unit))) then {
          _backpackItems = backpackItems player;
          removeBackpack _unit;
          _unit addBackpack _radio1;
          {player addItemToBackpack _x;} forEach _backpackItems;
        };
      } else {
        // If unit is in the list of units that receive a long-range radio, do so.
        if(_typeOfUnit in f_radios_settings_tfr_backpackRadios) then {
          _backpackItems = backpackItems player;
          removeBackpack _unit;
          _unit addBackpack _radio1;
          {player addItemToBackpack _x;} forEach _backpackItems;
        };
      };

  };

};

// ====================================================================================
