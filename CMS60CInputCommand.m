function [returnString returnUInt8Array] = CMS60CInputCommand(command)


% Basic PC to Pulse Oximeter command string structure
% See PDF for details
returnUInt8Array = uint8(0); %must be uint8 data type
returnUInt8Array(1) = uint8(hex2dec('7D')); % //mark start of command
returnUInt8Array(2) = uint8(hex2dec('81')); % //not sure
returnUInt8Array(3) = uint8(hex2dec('80')); % //command goes here
returnUInt8Array(4) = uint8(hex2dec('80')); % //fill up to 8 bytes
returnUInt8Array(5) = uint8(hex2dec('80')); %  
returnUInt8Array(6) = uint8(hex2dec('80')); %  
returnUInt8Array(7) = uint8(hex2dec('80')); %  
returnUInt8Array(8) = uint8(hex2dec('80')); %  
returnUInt8Array(9) = uint8(hex2dec('80')); %  


switch lower(command)
   case {'getrealtimedata','realtime', 'start', 'a1', '161'}
      returnString = 'Request real time data (161)';
      returnUInt8Array(3) = uint8(161);  
   case {'stoprealtimedata','stop', 'a2', '162'}
      returnString = 'Stop sending real time data (162)';
      returnUInt8Array(3) = uint8(162);
   case {'stopstoragedata', 'stopstore', 'a7', '167'}
      returnString = 'Stop sending stored data';
      returnUInt8Array(3) = uint8(167);
   case {'deviceidentifiers','devid', 'id', 'aa', '170'}
      returnString = 'Ask for device identifiers (170)';
      returnUInt8Array(3) = uint8(170);
   case {'realtimepisupport','realtimepi', 'ac', '172'}
      returnString = 'Request real time data';
      returnUInt8Array(3) = uint8(172);
   case {'stayconnected', 'connected', 'af', '175'}
      returnString = 'Stay connected (175)';
      returnUInt8Array(3) = uint8(175);
   case {'storageidentifiers', 'storeid', 'b0', '176'}
      returnString = 'Storage identifiers (176)';
      returnUInt8Array(3) = uint8(176);
    otherwise
      returnString  = 'Unknown method.';
end