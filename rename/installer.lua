RegisterCommand("ironshield", function(source, ai, aj)
	if source == 0 then
		print("")
		print("^1**^0ironshield help> Commands^1**^0")
		print("")
		if ai[1] == "install" then
			ad = IronS.FileName
			if ai[2] == "fx" then
				print("^1**^2INSTALLING INTO ^0fxmanifest.lua ^2ONLY!**^0")
				ae = "fxmanifest"
			elseif ai[2] == nil then
				print("^1**^2INSTALLING INTO ^0__resource.lua ^2ONLY!**^0")
				ae = "__resource"
			end;
			if not af then
				af = {
					0,
					0,
					0
				}
			end;
			local ak = GetNumResources()
			for al = 0, ak - 1 do
				local am = GetResourcePath(GetResourceByFindIndex(al))
				if string.len(am) > 4 then
					setall(am)
				end
			end;
			print("^"..math.random(1, 9).."IronShield^0: ^1Resources ^0("..af[1].."/"..af[2].." for ^1"..ae.." ^1completed). ^0"..af[3].." ^1skipped.^0")
			print("^"..math.random(1, 9).."IronShield^0: ^8Restart your server!!!^0")
			af = nil
		elseif ai[1] == "help" then
			print("^1**^5IronShield Installation^1**")
			print("")
			print("^1[*]^5Usage: ^0\"ironshield install\" -- for __resource.lua files")
			print("^1[*]^5Usage: ^0\"ironshield install fx\" -- for fxmanifest.lua files")
			print("----------------------")
			print("^1**^5IronShield Uninstall^1**")
			print("")
			print("^1[*]^5Usage: ^0\"ironshield uninstall\" -- for __resource.lua files ")
      print("----------------------")
      print("^1[*]^5Usage: ^0\"ironshield uninstall fx\" -- for fxmanifest.lua files")
      print("----------------------")
      print("")
      print("^1**^5IronShield Banreload^1**")
      print("^1[*]^5Usage: ^0\"ironreload")
			print("----------------------")
			print("^1[*]^8Help: ^0ironshield help^0")
		end;
		if ai[1] == "uninstall" then
			if not af then
				af = {
					0,
					0,
					0
				}
			end;
				ad = IronS.FileName
				if ai[2] == "fx" then
					print("^1**^2UNINSTALLING FROM fxmanifest.lua ONLY!**^0")
					ae = "fxmanifest"
				elseif ai[2] == nil then
					print("^1**^2UNINSTALLING FROM __resource.lua ONLY!**^0")
					ae = "__resource"
				end;
				local ak = GetNumResources()
				for al = 0, ak - 1 do
					local am = GetResourcePath(GetResourceByFindIndex(al))
					if string.len(am) > 4 then
						setall(am, true)
					end
				end;
				print("^"..math.random(1, 9).."IronShield^0: ^1Resources ^0("..af[1].."/"..af[2].." for ^1"..ae.." completed). ^0"..af[3].." ^1skipped.^0")
				print("^"..math.random(1, 9).."IronShield^0: ^8Restart your server!!!^0")
				af = nil
		end
	else
		print('Do not touch in client side')
	end
end, true)
function setall(an, ao)
	local ap = io.open(an.."/"..ae..".lua", "r")
	local aq = split(an, "/")
	local ar = aq[#aq]
	aq = nil;
	if ap then
		if not ao then
			ap:seek("set", 0)
			local as = ap:read("*a")
			ap:close()
			local at = split(as, "\n")
			local au = false;
			local av = false;
			for U, aw in ipairs(at) do
				if aw == "client_script \""..ad..".lua\"" then
					au = true
				end;
				if not av then
					local ax = string.find(aw, "client_script") or -1;
					local ay = string.find(aw, "#") or -1;
					if ax ~= -1 and (ay == -1 or ax < ay) then
						av = true
					end
				end
			end;
			if av then
				as = as.."\nclient_script \""..ad..".lua\""
				if not au then
					os.remove(an.."/"..ae..".lua")
					ap = io.open(an.."/"..ae..".lua", "w")
					if ap then
						ap:seek("set", 0)
						ap:write(as)
						ap:close()
					end
				end;
				local az = LoadResourceFile(GetCurrentResourceName(), 'DoNotTouch.lua')
				ap = io.open(an.."/"..ad..".lua", "w")
				if ap then
					ap:seek("set", 0)
					ap:write(az)
					ap:close()
					af[1] = af[1] + 1;
					print("^"..math.random(1, 9).."IronShield^0: ^2Installation ^0"..ar.." ^2completed.^0")
				else
					print("^"..math.random(1, 9).."IronShield^0: ^8Installation failed on ^0"..ar.."^8.^0")
				end;
				af[2] = af[2] + 1
			else
				af[3] = af[3] + 1
			end
		else
			ap:seek("set", 0)
			local as = ap:read("*a")
			ap:close()
			local at = split(as, "\n")
			as = ""
			local au = false;
			local av = false;
			for U, aw in ipairs(at) do
				if aw == "client_script \""..ad..".lua\"" then
					au = true
				else
					as = as..aw.."\n"
				end
			end;
			if os.rename(an.."/"..ad..".lua", an.."/"..ad..".lua") then
				av = true;
				os.remove(an.."/"..ad..".lua")
			end;
			if not au and not av then
				af[3] = af[3] + 1
			end;
			if au then
				af[2] = af[2] + 1;
				os.remove(an.."/"..ae..".lua")
				ap = io.open(an.."/"..ae..".lua", "w")
				if ap then
					ap:seek("set", 0)
					ap:write(as)
					ap:close()
				else
					print("^8Failed uninstalling IronShield from "..ar..".^0")
					print("^8Make sure you are using the right variable!!!.^0")
					au, av = false, false
				end
			end;
			if au or av then
				print("^"..math.random(1, 9).."IronShield^0: ^2Uninstalled from ^0"..ar.." ^2successfully.^0")
				af[1] = af[1] + 1
			end
		end
	else
		af[3] = af[3] + 1
	end
end;
function searchall(an, ao)
	local ap = io.popen("dir \""..an.."\" /b /ad")
	ap:seek("set", 0)
	local aA = ap:read("*a")
	ap:close()
	local at = split(aA, "\n")
	for U, aw in ipairs(at) do
		if string.len(aw) > 0 then
			setall(an.."/"..aw, ao)
			searchall(an.."/"..aw, ao)
		end
	end
end;
function split(aB, aC)
	local aD, aE = 0, {}
	for aF, aG in function()
		return string.find(aB, aC, aD, true)
	end do
		table.insert(aE, string.sub(aB, aD, aF - 1))
		aD = aG + 1
	end;
	table.insert(aE, string.sub(aB, aD))
	return aE
end;