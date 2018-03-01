BOT_NAME = redis:get(boss..'bot:name')
do 
local function run(msg, matches) 
local r =  matches[1]
local r2 = matches[2]
local r3 = matches[3]
local r4 = matches[4]
---------------[bot out]---------------------------
if r == BOT_NAME and r2 == 'غادر' and is_sudo(msg) then
sendMessage(msg.to.id, msg.id, 1, 'اوك باي 😢💔💯', 1, 'html')
botrem(msg)
end   
if (r == "ضع اسم للبوت" or r== 'ضع اسم للبوت ©') and is_sudo(msg) then
if not we_sudo(msg) then return "☔️هذا الاوامر للمطور الاساسي فقط 🌑" end
redis:setex(boss..'namebot:witting'..msg.from.id,300,true)
return"📭¦ حسننا قلبي  ✋🏿\n🗯¦ الان ارسل الاسم  للبوت 🍃"
end
-------[/start and welcom and save user id ]-----------
if r=="/start" and msg.to.type == 'pv'  then
if we_sudo(msg) then
local text = '🎖¦ آهہ‏‏لآ عزيزي آلمـطـور 🍃\n💰¦ آنتهہ‏‏ آلمـطـور آلآسـآسـي هہ‏‏نآ 🛠\n...\n\n🚸¦ تسـتطـيع‏‏ آلتحگم بگل آلآوآمـر آلمـمـوجودهہ‏‏ بآلگيبورد\n⚖️¦ فقط آضـغط ع آلآمـر آلذي تريد تنفيذهہ‏‏'

local keyboard = {
 {"ضع اسم للبوت ©","ضع صوره للترحيب 🌄"},
 {"تعطيل التواصل ✖️","تفعيل التواصل 🔛"},
 {"المطورين 🕹","ايدي 🆔","الاحصائيات 📈"},
 {"اضف رد عام ➕","الردود العامه 🗨"},
 {"الملفات 🗂","اذاعه عام بالتوجيه 📣"},
 {"اذاعه 🗣","اذاعه عام 📢","اذاعه خاص 👤"},
 {"تحديث ♻️","قائمه العام 📜","قناة السورس 📡"},
 {"تحديث السورس ™"},
 {"الغاء الامر ✖️"}}
return send_inline_key(msg.from.id,text,keyboard)
else
 redis:sadd(boss..'users',msg.from.id)
local text = [[💯¦ مـرحبآ آنآ بوت آسـمـي ]]..BOT_NAME..[[ 🎖
💰¦ آختصـآصـي حمـآية الكروبات..
📛¦ مـن آلصوات والروابط والتوجيه وآلخ...
🚸¦ فقط آلمـطـور يسـتطـيع تفعيل آلبوت
⚖️¦ مـعرف آلمـطـور  : ]]..SUDO_USER..[[

👨🏽‍🔧]]
xsudouser = SUDO_USER:gsub('@','')
xsudouser = xsudouser:gsub([[\_]],'_')
local inline = {{{text="آلمـطـور ™",url="t.me/"..xsudouser}}}
return send_inline_key(msg.from.id,text,nil,inline)
end end
if (msg.to.type == "pv") and is_sudo(msg) and msg.from.id ~= bot.id then -- ارسال الرساله بالخاص عبر رد على التوجيه
if msg.reply_id then
function get_msg_id(arg, data)
function replay_fwd(arg,data)
if data.forward_info_ then
function infousers(arg,data)
if data.username_ then user_name = '@'..data.username_ else user_name = data.first_name_ end
sendMessage(arg.user_id, 0,1,'['..r..']', 1, 'md')
sendMessage(msg.from.id, msg.id_,1,"📬¦ تم آرسـآل آلرسـآل‏‏هہ 🌿\n🎟¦ آلى : "..user_name.." 🏌🏻", 1, 'html') end
tdcli_function ({ID = "GetUser",user_id_ = data.forward_info_.sender_user_id_}, infousers, {user_id=data.forward_info_.sender_user_id_})  end end
tdcli_function ({ ID = 'GetMessage', chat_id_ = msg.chat_id_, message_id_ = data.id_ },replay_fwd,nil) end
tdcli_function ({ ID = 'GetMessage', chat_id_ = msg.chat_id_, message_id_ = msg.reply_to_message_id_ }, get_msg_id,nil)
end end
if (msg.to.type == "pv") and not is_sudo(msg) and msg.from.id ~= bot.id and not redis:get(boss..'lock_twasel') then -- ارسال رساله للاعضاء الي يدخلون خاص
sendMessage(msg.to.id, 0, 1, "🗯¦ تم آرسـآل رسـآلتگ آلى آلمـطـور\n📬¦ سـآرد عليگ في آقرب وقت\n🏌 ["..SUDO_USER.."]", 1, 'md')
forwardMessages(SUDO_ID,msg.to.id,{[0] = msg.id}, 0)
end
if (r=="تيست" or r=="test") and is_sudo(msg) then return "💯 البوت شـغــال 🚀" end
if (r== "ايدي" or r=="ايدي 🆔") and msg.to.type == "pv" then return  "\n"..msg.from.id.."\n"  end
if r== "قناة السورس 📡" and msg.to.type == "pv" then
local inline = {{{text="قنآهہ‏‏ آلسـورس : ماكس 🍃",url="t.m/hooooooooooooop"}}}
return send_inline_key(msg.from.id,'  [قناة السورس : ماكس](t.me/hooooooooooooop)',nil,inline)
end
if (r== "الاحصائيات 📈" or r=="الاحصائيات") and is_sudo(msg) then
local group = redis:smembers(boss..'group:ids')
local pv = redis:smembers(boss..'users')
return 'الاحصائيات : 📈 \n\n👥*¦* عدد المجموعات المفعله : '..#group..'\n👤*¦* عدد المشتركين في البوت : '..#pv..'\n📡'
end
---------------[End Function data] -----------------------
if r=="اضف رد عام" or r=="اضف رد عام ➕" then
if not we_sudo(msg) then return "☔️هذا الاوامر للمطور الاساسي فقط 🌑" end
redis:setex(boss..'addrd_all:'..msg.from.id,300 , true)
redis:del(boss..'allreplay:'..msg.from.id)
return "📭¦ حسننا الان ارسل كلمة الرد العام 🍃\n"
end
------------------------------------------------------
if msg.text and not msg.text~='الغاء الامر ✖️' and not msg.text~='الغاء الامر'  and not msg.text~='الغاء' then
if redis:get(boss..'namebot:witting'..msg.from.id) then --- استقبال اسم البوت 
redis:del(boss..'namebot:witting'..msg.from.id)
redis:set(boss..'bot:name',msg.text)
reload_plugins() 
return "📭¦ تم تغير اسم البوت  ✋🏿\n🗯¦ الان اسمه `"..msg.text.."` \n✔️"
end
if redis:get(boss..'addrd_all:'..msg.from.id) then -- استقبال الرد لكل المجموعات
if not redis:get(boss..'allreplay:'..msg.from.id) then-- استقبال كلمه الرد لكل المجموعات
redis:setex(boss..'allreplay:'..msg.from.id,300,msg.text)
return "👨🏽‍✈️*¦* شكرأ لك 😻\n👨🏽‍💻*¦* الان ارسل جواب الرد \n-" 
end
if redis:get(boss..'allreplay:'..msg.from.id) then -- استقبال جواب الرد لكل المجموعات
redis:hset(boss..'replay:all', redis:get(boss.."allreplay:"..msg.from.id), msg.text)
redis:del(boss..'addrd_all:'..msg.from.id)
return '(['..redis:get(boss..'allreplay:'..msg.from.id)..'])\n  ✓ تم اضافت الرد لكل المجموعات 🚀 '
end end
-------------------------------------------------------------
if redis:get(boss..'addrd:'..msg.from.id) then -- استقبال الرد للمجموعه فقط
if not redis:get(boss..'replay1'..msg.from.id) then  -- كلمه الرد
local names = redis:hdel(boss..'replay:'..msg.to.id,msg.text)
local photo =redis:hdel(boss..'replay_photo:group:'..msg.to.id,msg.text)
local voice = redis:hdel(boss..'replay_voice:group:'..msg.to.id,msg.text)
local animation = redis:hdel(boss..'replay_animation:group:'..msg.to.id,msg.text)
local audio = redis:hdel(boss..'replay_audio:group:'..msg.to.id,msg.text)
local sticker = redis:hdel(boss..'replay_sticker:group:'..msg.to.id,msg.text)
local video = redis:hdel(boss..'replay_video:group:'..msg.to.id,msg.text)
redis:setex(boss..'replay1'..msg.from.id,300,msg.text)
return "📜¦ جيد , يمكنك الان ارسال جواب الرد \n🔛¦ [[ نص,صوره,فيديو,متحركه,بصمه,اغنيه ]] ✓\n-" 
end
if redis:get(boss..'replay1'..msg.from.id) then -- جواب الرد
redis:hset(boss..'replay:'..msg.to.id, redis:get(boss.."replay1"..msg.from.id), msg.text)
redis:del(boss..'addrd:'..msg.from.id)
return '(['..redis:get(boss..'replay1'..msg.from.id)..'])\n  ✓ تم اضافت الرد 🚀 \n-'
end end
if redis:get(boss..'delrd:'..msg.from.id) then
redis:del(boss..'delrd:'..msg.from.id)
local names = redis:hget(boss..'replay:'..msg.to.id,msg.text)
local photo =redis:hget(boss..'replay_photo:group:'..msg.to.id,msg.text)
local voice = redis:hget(boss..'replay_voice:group:'..msg.to.id,msg.text)
local animation = redis:hget(boss..'replay_animation:group:'..msg.to.id,msg.text)
local audio = redis:hget(boss..'replay_audio:group:'..msg.to.id,msg.text)
local sticker = redis:hget(boss..'replay_sticker:group:'..msg.to.id,msg.text)
local video = redis:hget(boss..'replay_video:group:'..msg.to.id,msg.text)
if not (names or photo or voice or animation or audio or sticker or video) then
return '💬*¦* هذا الرد ليش مضاف في قائمه الردود 📛'
else
redis:hdel(boss..'replay:'..msg.to.id,msg.text)
redis:hdel(boss..'replay_photo:group:'..msg.to.id,msg.text)
redis:hdel(boss..'replay_voice:group:'..msg.to.id,msg.text)
redis:hdel(boss..'replay_audio:group:'..msg.to.id,msg.text)
redis:hdel(boss..'replay_animation:group:'..msg.to.id,msg.text)
redis:hdel(boss..'replay_sticker:group:'..msg.to.id,msg.text)
redis:hdel(boss..'replay_video:group:'..msg.to.id,msg.text)
return '(['..msg.text..'])\n  ✓ تم مسح الرد 🚀 '
end end
if redis:get(boss..'delrdall:'..msg.from.id) then
redis:del(boss..'delrdall:'..msg.from.id)
if not redis:hget(boss..'replay:all',msg.text) then
return '💬*¦* هذا الرد ليش مضاف في قائمه الردود 📛'
else
redis:hdel(boss..'replay:all',msg.text)
return '(['..msg.text..'])\n  ✓ تم مسح الرد 🚀 '
end end end
if r== 'مسح الردود' then
if not is_owner(msg) then return"♨️ للمدراء فقط ! 💯" end
local names = redis:hkeys(boss..'replay:'..msg.to.id)
local photo =redis:hkeys(boss..'replay_photo:group:'..msg.to.id)
local voice = redis:hkeys(boss..'replay_voice:group:'..msg.to.id)
local animation = redis:hkeys(boss..'replay_animation:group:'..msg.to.id)
local audio = redis:hkeys(boss..'replay_audio:group:'..msg.to.id)
local sticker = redis:hkeys(boss..'replay_sticker:group:'..msg.to.id)
local video = redis:hkeys(boss..'replay_video:group:'..msg.to.id)
if #names==0 and #photo==0 and #voice==0 and #animation==0 and #audio==0 and #sticker==0 and #video==0 then
return '🚸*¦* لا يوجد ردود ليتم مسحها \n❕'
end
for i=1, #names do redis:hdel(boss..'replay:'..msg.to.id,names[i]) end
for i=1, #photo do redis:hdel(boss..'replay_photo:group:'..msg.to.id,photo[i]) end
for i=1, #voice do redis:hdel(boss..'replay_voice:group:'..msg.to.id,voice[i]) end
for i=1, #animation do redis:hdel(boss..'replay_animation:group:'..msg.to.id,animation[i]) end
for i=1, #audio do redis:hdel(boss..'replay_audio:group:'..msg.to.id,audio[i]) end
for i=1, #sticker do redis:hdel(boss..'replay_sticker:group:'..msg.to.id,sticker[i]) end
for i=1, #video do redis:hdel(boss..'replay_video:group:'..msg.to.id,video[i]) end
return "✓ تم مسح كل الردود 🚀"
end
if r== 'مسح الردود العامه' then
if not is_sudo(msg) then return"♨️ للمطورين فقط ! 💯" end
local names = redis:hkeys(boss..'replay:all')
for i=1, #names do redis:hdel(boss..'replay:all',names[i]) end
return "✓ تم مسح كل الردود العامه🚀"
end
if r== 'مسح رد عام' then
if not is_sudo(msg) then return"♨️ للمطورين فقط ! 💯" end
redis:set(boss..'delrdall:'..msg.from.id,true) return "📭¦ حسننا عزيزي  ✋🏿\n🗯¦ الان ارسل الرد لمسحها من  المجموعات 🍃"
end
if r== 'مسح رد' then
if not is_owner(msg) then return"♨️ للمدراء فقط ! 💯" end redis:set(boss..'delrd:'..msg.from.id,true)
return "📭¦ حسننا عزيزي  ✋🏿\n🗯¦ الان ارسل الرد لمسحها من  للمجموعه 🍃"
end
if r== 'الردود' and is_owner(msg) then
local names = redis:hkeys(boss..'replay:'..msg.to.id)
local photo =redis:hkeys(boss..'replay_photo:group:'..msg.to.id)
local voice = redis:hkeys(boss..'replay_voice:group:'..msg.to.id)
local animation = redis:hkeys(boss..'replay_animation:group:'..msg.to.id)
local audio = redis:hkeys(boss..'replay_audio:group:'..msg.to.id)
local sticker = redis:hkeys(boss..'replay_sticker:group:'..msg.to.id)
local video = redis:hkeys(boss..'replay_video:group:'..msg.to.id)
if #names==0 and #photo==0 and #voice==0 and #animation==0 and #audio==0 and #sticker==0 and #video==0 then return '🚸*¦* لا يوجد ردود مضافه حاليا \n❕' end
local ii = 1
local message = '💬*¦* ردود البوت في المجموعه  :\n\n'
for i=1, #photo do message = message ..ii..' - *{* '..photo[i]..' *}_*( صوره 🏞 ) \n' ii = ii + 1 end
for i=1, #names do message = message ..ii..' - *{* '..names[i]..' *}_*( نص 🗯 ) \n' ii = ii + 1 end
for i=1, #voice do message = message ..ii..' - *{* '..voice[i]..' *}_*( تسجيل 🎙 ) \n' ii = ii + 1 end
for i=1, #animation do message = message ..ii..' - *{* '..animation[i]..' *}_*( متحركه 🎭 ) \n' ii = ii + 1 end
for i=1, #audio do message = message ..ii..' - *{* '..audio[i]..' *}_*( صوتيه 🔊 ) \n' ii = ii + 1 end
for i=1, #sticker do message = message ..ii..' - *{* '..sticker[i]..' *}_*( ملصق 🗺 ) \n' ii = ii + 1 end
for i=1, #video do message = message ..ii..' - *{* '..video[i]..' *}_*( فيديو  🎞 ) \n' ii = ii + 1 end
return message..'\n➖➖➖'
end
if (r== 'الردود العامه' or r=='الردود العامه 🗨') and is_sudo(msg) then
local names = redis:hkeys(boss..'replay:all')
if #names == 0 then return "👨🏾‍🔧¦ لا يوجد ردود مضافه للمجموعات ✋🏿" end
local i = 1
local message = '💢 ردود العامه في البوت  💯\n\n'
for i=1, #names do message = message ..i..' - ('..names[i]..') \n' i = i + 1 end return message
end
if not redis:get(boss..'group:add'..msg.to.id) then return end
if r=="اضف رد" then
if not is_owner(msg) then return"♨️ للمدراء فقط ! 💯" end
redis:setex(boss..'addrd:'..msg.from.id,300,true) redis:del(boss..'replay1'..msg.from.id)
return "📭¦ حسننا , الان ارسل كلمه الرد \n-"
end
if r== "اسمي"  then return  "\n" ..check_name(msg.from.first_name).."\n" 
elseif r== "معرفي" then return  "@"..(msg.from.username or " ---").."\n" 
elseif r== "ايديي" or r=="ايدي 🆔" then return  "\n"..msg.from.id.."\n" 
elseif r=="صورتي" then
tdcli_function ({ID = "GetUserProfilePhotos",user_id_ = msg.from.id,offset_ = 0,limit_ = 1}, function(arg, data)
if data.photos_[0] then sendPhoto(msg.to.id,msg.id,0,1,nil,data.photos_[0].sizes_[1].photo_.persistent_id_,"",dl_cb,nil)
else sendMessage(msg.to.id,msg.id,1,"🚸¦ لا يوجد صوره في بروفايلك ...\n-",1,'md')
end end, nil)
elseif r=="اريد رابط الحذف" or r=="اريد رابط حذف" or r=="رابط حذف" or r=="رابط الحذف" then
return [[
🌿*¦* رابط حذف حـساب التيليگرام ↯
📛¦ موفق عبش حياتك لا ترجع
👨🏽‍⚖️¦ بالتـوفيـق عزيزي ...
🚸 ¦ـ  https://telegram.org/deactivate
]] 
end
if msg.text and redis:get(boss..'replay'..msg.to.id) and msg.to.type == "channel" then
-- by @boss
local su = {"نعم حبيبي المطور 🌝❤","يابعد روح "..BOT_NAME.." 😘❤️","هلا بمطوري العشق أمرني"}
local  ss97 = {"ها حياتي😻","عيوني 👀  واذانه👂🏻","باقي ويتمدد 😎","ها حبي 😍","ها عمري 🌹","اجيت اجيت كافي لتصيح 🌚👌","هياتني اجيت 🌚❤️","نعم حبي 😎","هوه غير يسكت عاد ها شتريد 😷","احجي بسرعه شتريد 😤","ها يا كلبي ❤️","هم صاحو عليه راح ابدل اسمي من وراكم 😡","لك فداك "..BOT_NAME.." حبيبي انت اموووح 💋","دا اشرب جاي تعال غير وكت 😌","كول حبيبي أمرني 😍","احجي فضني شرايد ولا اصير ضريف ودكلي جرايد لو مجلات تره بايخه 😒😏","اشتعلو اهل "..BOT_NAME.." شتريد 😠","بووووووووو 👻 ها ها فزيت شفتك شفتك لا تحلف 😂","طالع مموجود 😒","هااا شنوو اكو حاته بالكروب وصحت عليه  😍💕","انت مو قبل يومين غلطت عليه؟  😒","راجع المكتب حبيبي عبالك "..BOT_NAME.." سهل تحجي ويا 😒","ياعيون "..BOT_NAME.." أمرني 😍","لك دبدل ملابسي اطلع برااااا 😵😡 ناس متستحي","سويت هواي شغلات سخيفه بحياتي بس عمري مصحت على واحد وكلتله انجب 😑","مشغول 😌  ☺️","مازا تريد منه 😌🍃",}
local bs = {"مابوس 🌚💔","اآآآم͠ــ.❤️😍ــو͠و͠و͠آ͠آ͠ح͠❤️عسسـل❤️","الوجه ميساعد 😐✋","ممممح😘ححح😍😍💋",}
local ns = {"🌹 هــلــℌelℓoووات🌹عمـ°🌺°ــري🙊😋","هْـٌﮩٌﮧٌ﴿🙃﴾ﮩٌـ୭ٌ୭ـْلوُّات†😻☝️","هلاوو99وووات نورت/ي ❤️🙈","هلووات 😊🌹",}
local sh = {"اهلا عزيزي المطور 😽❤️","هلوات . نورت مطوري 😍",}
local lovm = {"اكرهك 😒👌🏿","دي 😑👊🏾","اعشكك/ج مح 😍💋","اي احبك/ج 😍❤️","ماحبك/ج 😌🖖","امـــوت فيك ☹️","اذا كتلك/ج احبك/ج شراح تستفاد/ين 😕❤️","ولي ماحبك/ج 🙊💔",}
local thb = {"اموت عليه-ه 😻😻","فديته-ه 😍❤️","لا ماحبه-ه 🌚💔","اكرهه 💔🌚","يييع 😾👊🏿","مادري افڱﮩﮩﮩر🐸💔"}
local song = {'',"طاق طاق طاقيه😂رين رين يا جرس 🔔🔔محمد راكب عالفارس 💨🚶والدبه طاحت في البير 😳وصاحبها واحد خنزير 🤷‍♂🤷‍♂مين هوه مين..؟؟؟  😂🖖🏿","معلقني فيك وناسيني وعيوني مشتاقة لعينك😢وشوق بنارو يكويني يذكرني ويقلي وينك😭معلقني فيك وناسيني وعيوني مشتاقة لعينك😔وشوق بنارو يكويني يذكرني ويقلي وينك😔ليش تقسى وليش تزعل انا ليك😿انا قلبي وروحي والله يموتو فيك😟ليش تقسى وليش تزعل انا ليك انا قلبي وروحي والله يموتو فيك😭","😭موجوع كلبي😔والتعب بية☹️من اباوع على روحي😢ينكسر كلبي عليه😭","لا تظربني لا تظرب 💃💃 كسرت الخيزارانه💃🎋 صارلي سنه وست اشهر💃💃 من ظربتك وجعانه🤒😹","حلمي تحطم واختفى😔 والعزم في قلبي انطفى💔والدمع من عيني يسقط مرهفا","}
if redis:hget(boss..'replay:all', r) then return '['..redis:hget(boss..'replay:all', r)..']'
elseif redis:hget(boss..'replay_photo:group:'..msg.to.id, r) then return sendPhoto(msg.to.id, msg.id, 0, 1, nil, redis:hget(boss..'replay_photo:group:'..msg.to.id, r))  
elseif redis:hget(boss..'replay_voice:group:'..msg.to.id, r) then return sendVoice(msg.to.id, msg.id, 0, 1, nil, redis:hget(boss..'replay_voice:group:'..msg.to.id, r))
elseif redis:hget(boss..'replay_animation:group:'..msg.to.id, r) then return sendAnimation(msg.to.id, msg.id, 0, 1, nil, redis:hget(boss..'replay_animation:group:'..msg.to.id, r))  
elseif redis:hget(boss..'replay_audio:group:'..msg.to.id, r) then return sendAudio(msg.to.id, msg.id, 0, 1, nil, redis:hget(boss..'replay_audio:group:'..msg.to.id, r))  
elseif redis:hget(boss..'replay_sticker:group:'..msg.to.id, r) then return sendSticker(msg.to.id,msg.id,0,1,nil,redis:hget(boss..'replay_sticker:group:'..msg.to.id, r))  
elseif redis:hget(boss..'replay_video:group:'..msg.to.id, r) then return sendVideo(msg.to.id, msg.id, 0, 1, nil, redis:hget(boss..'replay_video:group:'..msg.to.id, r))  
elseif redis:hget(boss..'replay:'..msg.to.id, r) then return '['..redis:hget(boss..'replay:'..msg.to.id, r)..']'
elseif is_sudo(msg) and r== BOT_NAME and not r2 then  return  su[math.random(#su)]  
elseif not is_sudo(msg) and r== BOT_NAME and not r2 then  return  ss97[math.random(#ss97)]  
elseif r== "كول" and r2 then
if string.len(r2) > 80 then return "💢¦ ما اكدر اكول اكثر من 60 حرف 🙌🏾" end
if check_name(r2)~='الاسم سبام 📛' then
return sendMessage(msg.to.id,0,1,'*'..r2..'*',1,'md')  end
elseif r== "كله" and r2 then
if string.len(r2) > 80 then return "💢¦ ما اكدر اكله اكثر من 60 حرف 🙌🏾" end
if check_name(r2)~='الاسم سبام 📛' then
if msg.reply_id then return sendMessage(msg.to.id, msg.reply_id, 1, '`'..r2..'`', 1, 'md') end end
elseif r== BOT_NAME.."اتفل" and r2 then
if msg.reply_id then
sendMessage(msg.to.id, msg.id, 1, 'اوك سيدي 🌝🍃', 1, 'md')
sendMessage(msg.to.id, msg.reply_id, 1, 'ختفوووووووووو💦💦️️', 1, 'md')
else  return"  🕵🏻 وينه بله سويله رد 🙄" end
elseif r== BOT_NAME.." رزله" and r2 and is_sudo(msg) then
if msg.reply_id then
sendMessage(msg.to.id, msg.id, 1, 'اوك سيدي 🌝🍃', 1, 'md')
sendMessage(msg.to.id, msg.reply_id, 1, 'يا ول شو طالعة عينك😒 من البنات مو😪و هم صايرلك لسان تحجي😠اشو تعال👋👊صير حباب مرة ثانية ترةة ...😉و لا تخليني البسك عمامة و اتفل عليك😂️', 1, 'md') end
elseif r== "بوس" and r2 then if msg.reply_id then return  bs[math.random(#bs)]  else return "📌 وينو😍اشرلي عليه وانا بفكر😂 🕵🏻" end 
elseif r== "تحب" and r2 then return  thb[math.random(#thb)] 
elseif is_sudo(msg) and r=="هلو" then return  sh[math.random(#sh)]  
elseif not is_sudo(msg) and r=="هلو" then return  ns[math.random(#ns)]  
elseif is_sudo(msg) and r== "احبك" then return  "اموت عليك حياتي  😍❤️"
elseif is_sudo(msg) and r== "تحبني" or r=="حبك"  then return  "اموت عليك حياتي  😍❤️"
elseif not is_sudo(msg) and r== "احبك" or r=="حبك" then return  lovm[math.random(#lovm)]  
elseif not is_sudo(msg) and r== "تحبني" then return  lovm[math.random(#lovm)]  
elseif r== "مسعود"  then return  ss97[math.random(#ss97)]    
elseif r== "غني" or r=="غنيلي" then return  song[math.random(#song)] 
elseif r=="اتفل" or r=="تفل" then
if is_mod(msg) then return 'ختفوووووووووو💦💦️️' else return "📌 اخرس ما اتفل عيب 😼🙌🏿" end
elseif r== "تف" then return  "عييييب تتفل هيك ربيتك انا 😌😹"
elseif r== "شلونكم" or r== "شلونك" or r== "شونك" or r== "شونكم"  or r== "كيفك" or r== "كيفكون" then return  "احســن مـنك انت كيفك شو اخبارك لسعك تزحف  😹🌚"
elseif r== "حلوه"  then return  " شووو اويلل قلبي هات صورتها 🐸💔"
elseif r== "وينك"  then return   "دور بقلبك تلقاني 😍😍❤️"
elseif r== "منورين"  then return  "من نورك  ❤️🌺"
elseif r== "هاي"  then return  "وعليكم الهاي🍷"
elseif r== "🙊"  then return  "تروح معي ع ادلب 🙊 😂"
elseif r== "😢"  then return  "صيح.دمع ابو🙊شمع 😂"
elseif r== "😭"  then return  "صيح دمع ابو🙊مشمع 😭😭"
elseif r== "منور"  then return  "نِْـِْـــِْ([💡])ِْــــًِـًًْـــِْـِْـِْـورِْكِْ"
elseif r== "😒" and not is_sudo then return  "شبك جكم بوزك 🤔"
elseif r== "مح"  then return  "ضب برطماك تول برطم جمل😂"
elseif r== "شكرا" or r== "ثكرا" then return  "{ •• الـّ~ـعـفو •• }"
elseif r== "انته وين"  then return  "بالــبــ🏠ــيــت"
elseif r== "😍"  then return  " ضب عيونك بلا زحف 😑"
elseif r== "اكرهك"  then return  "اكره الارض الي تشي عليها😾🖖🏿🕷"
elseif r== "بدي شوفها"  then return  "انا كمان بدي شوف عزريلي يخد روحك😹🙌️"
elseif r== "باي" or r=="بااي" or r=="باااي" or r=="بااااي" and check_name(msg.from.first_name)~='الاسم سبام 📛' then  return  "وعليكم الباي ❤️ [" ..msg.from.first_name.."]\n"
elseif r== "ملل"  then return  "روح ازحف  🙊😋"
elseif r== "اروح اصلي"  then return  "انته حافظ سوره الفاتحة😍❤️️"
elseif r== "خلو"  then return  "مين هاد ابعتي صورولشوف 💨"
elseif r== "اجيت" or r=="اني اجيت" then return  "كْـٌﮩٌﮧٌ﴿😍﴾ـﮩٌول الـ୭ـهـٌ୭ـْلا❤️"
elseif r== "طفي السبلت"  then return  "تم اطفاء السبلت بنجاح 🌚🍃"
elseif r== "شغل السبلت"  then return  "تم تشغيل السبلت بنجاح بردتو مبردتو معليه  🌚🍃"
elseif r== "حفلش"  then return  "افلش راسك 🤓"
elseif r=="نايمين" then return  "ني سهران احرسكـم😐🍃'"
elseif r=="في حدا هون" then return  "اي انا موجود🌝🌿"
elseif r=="شكو" then return  "كلشي وكلاشي🐸تگـول عبالك احنـة بالشورجـة🌝"
elseif r=="مين انتو" then return  "اسيادك 😜🙌"
elseif r=="كلخرا" then return  "حط حالك بصحن😸🙊💋"
elseif r== "حبيبتي" then return  "مين هل بقرا الي قبلت فيك 😂 😔☹"
elseif r== "رح انام" then return  "واخيراً 😂"
elseif r== "😔"  then return  "شبك 😞 ❤️🍃"
elseif r== "☹️"  then return  "لا تزعل عيش حياتك 😢❤️🍃"
elseif r== "جوعان" or r== "جوعانه" then return  "انقلعوامل اكل وعزمني 😐😂"
elseif r== "تعال خاص" or r== "خاصك" or r=="شوف الخاص" or r=="شوف خاص" then return  "الخاص لزواحف بب😉"
elseif r== "اخرس"  then return  "انت اخرس ما حكيت معك 😒"
elseif r== "معليك" or r== "شعليك" then return  "عليه ونص 😡"
elseif r== "شو عم تعملو" or r== "شو عم تعملي" or r== "ش ع ت " or r== "شو عم تساوي" then return  "نطبخ 😐"
elseif r== BOT_NAME and r2=="كيفك" or r== "كيفكون" or r== "شلونك" or r== "شلونكم"  then return "احســن مــن انك انت كفلك لسعتك عم تزحف😹🌚"
elseif r== "فديتك"  then return  "يفداك عزرايل😦"
elseif r== "عرفونا" or r== "عرفينا" or r== "عرفنا" or r== "شو اسمك" or r== "شو اسمكي" then return  "مو ضروري 😉"
elseif r== "احبك"  then return  "تحبك ستي😢"
elseif r== "ش في مافي"  then return  "مافي غير سلمتك صافيه وافيه"
elseif r== "اغير جو"  then return  "😂 ولا تزحف"
elseif r== "😋"  then return  "ضب لانك 😌"
elseif r== "😡"  then  return  "واو عصبي مثل اسامة  🚒"  
elseif r== "مرحبا"  then return  "مرراب 🌹"
elseif r== "سلام" or r== "السلام عليكم" or r== "سلام عليكم" or r=="سلامن عليكم" or r=="السلامن عليكم" then return  "وعليكم السلام 🌝👋" 
elseif r== "مات" or r== "ماتت" then return  "بعيد شر نشالله القردو يعني انته😢" 
elseif r== "من وين" or r== "كم عمرك"  then return  "شو دخلك👋🏻"
elseif r== "البوت وقف" then return  "ليكني 😐"
elseif r== "تعبان" or r== "تعبانه" then return  "ليش كاين ترقص ديس باسيتو🙊😂"
elseif r== "ضايجه"  then return  "منو مضوجج كبدايتي"
elseif r== "😳" or r== "😳😳" or r== "😳😳😳" then return  "شو تحت سلفي بل غلط؟ 😳😹🕷"
elseif r== "جد"  then return  "لا عم كذب🌚"
elseif r== "مصروع"  then return  "نعم عزيزي باقي واتمدد 😎🌿"
elseif r== "تخليني"  then return  "اخليك بزاويه 380 درجه وانته تعرف الباقي 🐸"
elseif r== "فديتك" or r== "فديتنك"  then return  "فداكـ جدي😍😂" 
elseif r== "بوت"  then return  "أسمي "..BOT_NAME.." 🌚🌸"
elseif r== "مساعدة"  then return  "لعرض قائمة المساعدة اكتب الاوامر 🌚❤️"
elseif r== "زاحف"  then return  "الحمد الله😎 🌝"
elseif r== "حلو"  then return  "انت الاحلى 🌚❤️"
elseif r== "تبادل"  then return  "ما مليت من التبادل😕💔"
elseif r== "عاش"  then return  "مطوري🌝🌷"
elseif r== "مات"  then return  "اسامه 🕊🕊"
elseif r== "ورده" or r== "وردة"  then return  "أنت/ي  عطرها 🌹🌸"
elseif r== "شسمك"  then return  "مكتوب فوك 🌚🌿"
elseif r== "فديت" or r=="فطيت" then return  "اخرس"
elseif r== "واو"  then return  "وجع🌝🌿"
elseif r== "زاحفه" or r== "زاحفة"  then return  "ماضيك عندي بل خاص يا زاخف🌝🌸"
elseif r== "حبيبي" or r=="حبي" then return  "بعد روحي 😍❤️ تفضل"
elseif r== "حبيبتي" then return  "تحبك وتحب عليك 🌝🌷"
elseif r== "حياتي" then return  "ها حياتي 😍🌿"
elseif r== "عمري" then return  "خلصبمفي زحف🌝🌿 "
elseif r== "اسكت" then return  "انت اسكت 🌚💞"
elseif r== "بتحبني" then return  "بحبك اد الكون 😍🌷"
elseif r== "مسيقى" or r=="المعزوفة" or r=="معزوفه" then return  "طرطاا طرطاا طرطاا 😂👌"
elseif r== "موجود" then return  "تفضل عزيزي 🌝🌸"
elseif r== "ابدي قلك" then return  ".تفضل 😚🌿"
elseif r== "فدوه" or r=="فدوة" or r=="فطوه" or r=="فطوة" then  return  "لقلبك😍❤️"
elseif r== "دي"  then return  "خليني احہۣۗبہۜۧ😻ہہۖۗڱֆ ̮⇣  🌝💔"
elseif r== "شكرا" then return  "ولو بل خدمه❤"
elseif r== "😉"  then return  "😻🙈"
elseif r== "اقرالي دعاء"  then return "اللهم عذب المدرسين 😢 منهم الاحياء والاموات 😭🔥 اللهم عذب ام الانكليزي 😭💔 وكهربها بلتيار الرئيسي 😇 اللهم عذب ام الرياضيات وحولها الى غساله بطانيات 🙊 اللهم عذب ام الاسلاميه واجعلها بائعة الشاميه 😭🍃 اللهم عذب ام العربي وحولها الى بائعه البلبي اللهم عذب ام الجغرافيه واجعلها كلدجاجه الحافية اللهم عذب ام التاريخ وزحلقها بقشره من البطيخ وارسلها الى المريخ اللهم عذب ام الاحياء واجعلها كل مومياء اللهم عذب المعاون اقتله بلمدرسه بهاون 😂😂😂","الله يشلك 🐸ويمد عمرك😂","اللهم ارزقني برجل من أرقى العائلات😂💖وحاصل على أعلى الشهادات😍 ويمتلك أغلى السيارات🚙 ومليان دولارات💴 ويهدي الألماسات💟💱وشهر العسل بين القارات🇫🇷🇺🇸🇬🇧🇷🇺🇪🇸🇮🇹🇰🇷🇨🇳وأمه وأخته ميتات💀😂","} 
elseif msg.edited and not is_mod(msg) then return "تضرب بدك مدرسة لغة 😹☝🏿"
elseif r== "انجب" or r== "نجب" or r=="جب" then
if is_sudo(msg) then  return   "حاضر تاج راسي انجبيت 😇 "
elseif is_owner(msg) then return   "لخاطرك راح اسكت لان مدير وع راسي  😌"
elseif is_mod(msg) then return   "فوك مامصعدك ادمن ؟؟ انته انجب 😏"
else return   "انجب انته لاتندفر 😏"
end end end  end
return {
patterns = {
"^("..BOT_NAME.." اتفل)(.*)$", 
"^("..BOT_NAME.." رزله)(.*)$", 
"^(بوس)(.*)$", 
"^(تحب) (.*)$",
"^("..BOT_NAME..") (.*)$",
"^(كله) (.*)$",
"^(كول) (.*)$",
"^(بوس) (.*)$", 
"(.*)" 
},
run = run,
}
end
