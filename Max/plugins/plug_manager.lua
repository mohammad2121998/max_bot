--[[
<< تم برمجه وكتابه السورس من قبل مطورين >>
<<         @BLCON  \  @TH3BOSS          >>
]] 
local function run(msg, matches) 
local update = redis:get(boss..":VERSION")
if (matches[1] == '/p' or matches[1]=="الملفات 🗂") and is_sudo(msg) then -- اضهار لسته الملفات الموجوده بالسيرفر
if not we_sudo(msg) then return "❖￤هذا الاوامر للمطور الاساسي فقط 🛠" end
return list_all_plugins() 
end 
if matches[1] == '+' and is_sudo(msg) then 
if not we_sudo(msg) then return "❖￤هذا الاوامر للمطور الاساسي فقط 🛠" end
return enable_plugin(matches[2]) 
end 
if matches[1] == '-' and is_sudo(msg) then 
if not we_sudo(msg) then return "❖￤هذا الاوامر للمطور الاساسي فقط 🛠" end
if matches[2] == 'plug_manager'  then return '🛠 لا يمكن تعطيل هذا الملف خاص بالتحكم بالملفات 🌚' end 
if plugin_exists(matches[2]) then
return disable_plugin(matches[2]) 
else return '🗂*¦* لا يوجد ملف بهذا الاسم ❕ \n\n'
end end 
if (matches[1]=="تحديث" or matches[1]=="we" or matches[1]=="تحديث ♻️") and is_sudo(msg) then -- تحديث الملفات
if not we_sudo(msg) then return "❖￤هذا الاوامر للمطور الاساسي فقط 🛠" end
reload_plugins() 
return " 🗂¦ تہ‏‏م تحديث آلمـلفآت \n✓"
end 
if (matches[1] == "sp" or matches[1] == "جلب ملف") and is_sudo(msg) then 
if not we_sudo(msg) then return "❖￤هذا الاوامر للمطور الاساسي فقط 🛠" end
if (matches[2]=="الكل" or matches[2]=="all") then
sendMessage(msg.to.id, msg.id, 1, '🗂*¦* انتضر قليلا سوف يتم ارسالك كل الملفات📢', 1, 'md')
for k, v in pairs(plugins_names()) do  
sendDocument(msg.to.id, msg.id,0, 1, nil, "./plugins/"..string.match (v, "(.*)%.lua") ..".lua", '🗂¦ آلمـلف مـقدم مـن قنآ‏‏هہ آلزعـًيـٌِم ¦ֆ \n📡¦ تابع قناة السورس @llDEV1ll\n👨🏽‍🔧', dl_cb, nil) end  else
if not plugin_exists(matches[2]) then 
return '🗂*¦* لا يوجد ملف بهذا الاسم .\n\n'
else  sendDocument(msg.to.id, msg.id,0,1,nil,"./plugins/"..matches[2]..".lua",'🗂¦ آلمـلف مـقدم مـن قنآ‏‏هہ آلزعـًيـٌِم ¦ֆ \n📡¦ تابع قناة السورس @llDEV1ll\n👨🏽‍🔧', dl_cb, nil)
end end end
if (matches[1] == "dp" or matches[1] == "حذف ملف")  and matches[2] and is_sudo(msg) then 
if not we_sudo(msg) then return "❖￤هذا الاوامر للمطور الاساسي فقط 🛠" end
if not plugin_exists(matches[2]) then return '🗂*¦* لا يوجد ملف بهذا الاسم ❕ \n\n'
else io.popen("rm -rf  plugins/"..matches[2]..".lua")
return 'تم حذف الملف \n↝ ['..matches[2]..']\n'
end end 
if matches[1]:lower() == "ssp" and matches[2] and matches[3] then
if not we_sudo(msg) then return "❖￤هذا الاوامر للمطور الاساسي فقط 🛠" end
sendDocument(msg.to.id, msg.id_,0, 1, nil, "./"..matches[2].."/"..matches[3], '💢┇ الملف مقدم من قناه  ﭬــﮧـيـﮧـر ¦ֆ \n💢┇ تابع قناة السورس @verxbot\n👨🏽‍🔧', dl_cb, nil) end
if (matches[1] == 'حفظ الملف' or matches[1] == 'save') and matches[2] and is_sudo(msg) then
if not we_sudo(msg) then return "❖￤هذا الاوامر للمطور الاساسي فقط 🛠" end
if msg.reply_id then
function get_filemsg(arg, data)
function get_fileinfo(arg,data)
if data.content_.ID == 'MessageDocument' then
file_id = data.content_.document_.document_.id_ 
file_name = data.content_.document_.file_name_
if (file_name:lower():match('.lua$')) then
tdcli_function ({ID = "DownloadFile",file_id_ = file_id}, dl_cb, nil) sleep(1) 
if file_exi(file_name, TG_folder..'/data/document') then
sendMessage(msg.to.id,msg.id,1,'🗂*¦* الملف `'..matches[2]..'.lua` تم رفعه في السورس \n✓', 1, 'md')
os.rename(TG_folder..'/data/document/'..file_name, './plugins/'..matches[2]..'.lua') reload_plugins()
else sendMessage(msg.to.id,msg.id,1,'📛*¦* فشل رفع الملف او يبدو ان عدد اسطر الملف اكثر من 500 سطر يمكنك المحاوله مره ثانيه وسوف يتم رفع الملف.\n❕', 1, 'md')
end else
sendMessage(msg.to.id,msg.id,1,'📛*¦* الملف ليس بصيغه [[lua.]]\n❕',1, 'md') end  else sendMessage(msg.to.id,msg.id,1,'📛*¦* عذرا , هذا ليس ملف \n❕',1, 'md') end end
tdcli_function({ID ='GetMessage',chat_id_=msg.chat_id_,message_id_=data.id_}, get_fileinfo, nil) end
tdcli_function({ID ='GetMessage',chat_id_=msg.chat_id_,message_id_=msg.reply_id}, get_filemsg, nil)
end end
if matches[1] == 'reload' and we_sudo(msg) then
sendMessage(msg.to.id,msg.id_,1,'⏳*┇* جاري اعاده تشغيل البوت ... \n⌛️',1,'md')
RELOAD_BOT(msg)
end
if matches[1] == 'اصدار السورس' then
return '👨🏾‍🔧¦ اصدار سورس الزعيم : `v'..update..'` \n📡'
end
if (matches[1] == 'تحديث السورس' or matches[1] == 'تحديث السورس ™') and is_sudo(msg) then
if not we_sudo(msg)  then return "📛*￤* هذا الاوامر للمطور الاساسي فقط 🛠" end
sendMessage(msg.to.id, msg.id,1, '📡*¦* جاري التحقق من وجود التحديثات ... ', 1, 'md')
local num_update = https.request('https://api.th3boss.com/version/') -- تحقق من التحديث اذا كان موجود او لا
if num_update > update then
sendMessage(msg.to.id, msg.id,1, '🔛*¦* يوجد تحديث جديد الان \n📡*¦* جاري تنزيل وتثبيت التحديث  ...', 1, 'md')
download_file('https://raw.githubusercontent.com/TH3BS/BOSS/master/inc/BOT.lua','./inc/BOT.lua')
download_file('https://raw.githubusercontent.com/TH3BS/BOSS/master/inc/functions.lua','./inc/functions.lua')
download_file('https://raw.githubusercontent.com/TH3BS/BOSS/master/inc/locks.lua','./inc/locks.lua')
download_file('https://raw.githubusercontent.com/TH3BS/BOSS/master/plugins/cmd_help.lua','./plugins/cmd_help.lua')
download_file('https://raw.githubusercontent.com/TH3BS/BOSS/master/plugins/plug_manager.lua','./plugins/plug_manager.lua')
download_file('https://raw.githubusercontent.com/TH3BS/BOSS/master/plugins/proc_msgs.lua','./plugins/proc_msgs.lua')
download_file('https://raw.githubusercontent.com/TH3BS/BOSS/master/plugins/rdod_bot.lua','./plugins/rdod_bot.lua')
download_file('https://raw.githubusercontent.com/TH3BS/BOSS/master/plugins/super_group.lua','./plugins/super_group.lua')
redis:set(boss..":VERSION",num_update)
sendMessage(msg.to.id,msg.id,1,'🔝*┇* تم تحديث السورس الى اصدار *v'..redis:get(boss..":VERSION")..'*\n📟*┇* سوف يتم اعاده تشغيل السورس انتظر ثواني ...',1,'md')
sleep(1)
RELOAD_BOT(msg)
else
return"👨🏾‍🔧*¦* السورس لديك محدث اخر اصدار \n📦"
end
end

if matches[1] == 'نسخه احتياطيه للمجموعات' and we_sudo(msg) then
buck_up_groups() sendMessage(msg.to.id,msg.id_,1,'⏳*┇* انتضر قليلا سوف انشىء ملف المجموعات ... \n⌛️',1,'md') sleep(1)
return sendDocument(msg.to.id, msg.id,0,1,nil,"./inc/buckup_all.lua",'🙋🏼‍♂️┇ مـرحبآ تم تگوين نسـخهہ‏‏ آلآحتيآطـيهہ ¦ֆ \n🌿┇ لديگ حآليآ ('..#redis:smembers(boss..'group:ids')..') مـجمـوعهہ‏‏ في آلمـلف\n👨🏽‍🔧', dl_cb, nil)
end
if matches[1] == 'رفع نسخه الاحتياطيه' and we_sudo(msg) then
if msg.reply_id then
function get_filemsg(arg, data)
function get_fileinfo(arg,data)
if data.content_.ID == 'MessageDocument' then
file_id = data.content_.document_.document_.id_ 
file_name = data.content_.document_.file_name_
if (file_name:lower():match('.lua$')) then
os.execute('rm ./inc/buckup_all.lua')
sendMessage(msg.to.id,msg.id,1,'⏳*┇* جاري رفع النسخه انتظر قليلا ... \n⌛️',1,'md')
tdcli_function ({ID = "DownloadFile",file_id_ = file_id}, dl_cb, nil) sleep(2) 
if file_exi(file_name, TG_folder..'/data/document') then
os.rename(TG_folder..'/data/document/'..file_name, './inc/buckup_all.lua') 
local ok, ERROR =  pcall(function() loadfile("./inc/buckup_all.lua")() end)
if not ok then
print(tostring(io.popen("lua ./inc/buckup_all.lua"):read('*all')))
print('\27[31m'..ERROR..'\27[39m')
end sendMessage(msg.to.id,msg.id,1,'📦*¦* تم رفع آلنسـخهہ‏‏ آلآحتيآطـيهہ\n⚖️*¦* حآليآ عدد مـجمـوعآتگ هہ‏‏يهہ‏‏ *'..#redis:smembers(boss..'group:ids')..'* 🌿\n✓', 1, 'md')
else sendMessage(msg.to.id,msg.id,1,'📛*¦* فشل رفع الملف او يبدو ان عدد اسطر الملف اكثر من 500 سطر يمكنك المحاوله مره ثانيه وسوف يتم رفع الملف.\n❕', 1, 'md') end 
else sendMessage(msg.to.id,msg.id,1,'📛*¦* الملف ليس بصيغه [[lua.]]\n❕',1, 'md') end  else sendMessage(msg.to.id,msg.id,1,'📛*¦* عذرا , هذا ليس ملف \n❕',1, 'md') end end
tdcli_function ({ ID = 'GetMessage', chat_id_ = msg.chat_id_, message_id_ = data.id_ }, get_fileinfo, nil) end
tdcli_function ({ ID = 'GetMessage', chat_id_ = msg.chat_id_, message_id_ = msg.reply_id }, get_filemsg, nil)
end end
if (matches[1] == 'السيرفر' or matches[1]:lower() == 'server') and is_sudo(msg) then
return io.popen([[
memTotal_b=`free -b |grep Mem |awk '{print $2}'`
memFree_b=`free -b |grep Mem |awk '{print $4}'`
memBuffer_b=`free -b |grep Mem |awk '{print $6}'`
memCache_b=`free -b |grep Mem |awk '{print $7}'`
memTotal_m=`free -m |grep Mem |awk '{print $2}'`
memFree_m=`free -m |grep Mem |awk '{print $4}'`
memBuffer_m=`free -m |grep Mem |awk '{print $6}'`
memCache_m=`free -m |grep Mem |awk '{print $7}'`
CPUPer=`top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4}'`
disk_used=`df -lh | awk '{if ($6 == "/") { print $3" - "$5 }}'`
disk_total=`df -lh | awk '{if ($6 == "/") { print $2}}'`
disk_free=`df -lh | awk '{if ($6 == "/") { print $4}}'`
uptime=`uptime | awk -F'( |,|:)+' '{print $6,$7",",$8,"Hours,",$9,"Minuts."}'`
ProcessCnt=`grep -c processor /proc/cpuinfo`
memUsed_b=$(($memTotal_b-$memFree_b-$memBuffer_b-$memCache_b))
memUsed_m=$(($memTotal_m-$memFree_m-$memBuffer_m-$memCache_m))
memUsedPrc=$((($memUsed_b*100)/$memTotal_b))

echo '🔛￤Memory Total : `'"$memTotal_m MB"'`'
echo '🔛￤Memory Used : `'"$memUsed_m MB - $memUsedPrc% used!"'`'
echo '🔛￤Disk Total : `'"$disk_total"' For disk.`'
echo '🔛￤Disk Used : `'"$disk_used"' used!`'
echo '🔛￤Disk Free : `'"$disk_free"' is free.`'
echo '🔛￤CPU Usage : `'"$CPUPer"'%`'
echo '🔛￤Processes : `Core'"$ProcessCnt"'`'
echo '🔛￤Login : `'"`whoami`"'`'
echo '🔛￤Uptime : '"$uptime"''
]]):read('*all')
end

end 

return { patterns = { "^/p$", "^/p? (+) ([%w_%.%-]+)$", "^/p? (-) ([%w_%.%-]+)$", "^(sp) (.*)$", "^(dp) (.*)$", "^(حذف ملف) (.*)$","^(جلب ملف) (.*)$","^(تحديث)$","^(تحديث ♻️)$","^(الملفات 🗂)$","^(we)$","^(ssp) ([%w_%.%-]+)/([%w_%.%-]+)$","^(تحديث السورس)$","^(تحديث السورس ™)$","^(reload)$","^(اصدار السورس)$","^(حفظ الملف) (.*)$","^(savefile) (.*)$","^(save) (.*)$","^(server)$", "^(السيرفر)$", "^(نسخه احتياطيه للمجموعات)$","^(رفع نسخه الاحتياطيه)$", },run = run} 
