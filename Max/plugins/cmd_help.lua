--[[
<< تم برمجه وكتابه السورس من قبل مطورين >>
<<         @Mylove21231         >>
]]
function run(msg, matches)
if msg.to.type == 'channel' and redis:get(boss..'group:add'..msg.to.id) then
if matches[1] == "الاوامر" then
if not is_mod(msg) then return "🔅¦ للاداريين فقط 🎖" end
return [[
👨🏽‍✈️*¦* الاوامـر الـ؏ـامـة

🔝*¦*ـ➖➖➖➖➖
👨🏽‍⚖️*¦* `م1 `➙ اوامر الادارة
📟*¦* `م2` ➙ اوامر اعدادات المجموعه
👩🏾‍🚒*¦* `م3` ➙ اوامر الحـمـايـة
🔅*¦* `م4` ➙ الاوامـر الـ؏ـامـة
🔅*¦* `م المطور` ➙ اوامر المطور
🔅*¦* `اوامر الرد` ➙ لاضافه رد معين
🔅*¦* `اوامر الملفات` ➙ لاضافه وتفعيل وحذف الملفات
🔝*¦*ـ➖➖➖➖➖

🗯*¦* راسلني للاستفسار 💡↭ ]]..SUDO_USER
end
if matches[1]== 'م1' then
if not is_mod(msg) then return "🔅¦ للاداريين فقط 🎖" end
local text =[[
🎖  اوامر الرفع والتنزيل📍
🔝*¦*ـ➖➖➖➖➖
🎖*¦* `رفع ادمن `: لرفع ادمن في البوت
🎭*¦* `تنزيل ادمن` : لتنزيل ادمن من البوت
🥇*¦* `رفع عضو مميز` : لرفع عضو مميز في البوت
🎯*¦* `تنزيل عضو مميز` : لتنزيل عضو مميز من البوت
🔝*¦*ـ➖➖➖➖➖
🏌🏻*¦* اوامر الطرد والحضر 🀄️
🔅*¦* `طرد بالرد` : لطرد العضو 
🔅*¦* `طرد + المعرف `: لطرد العضو
🔅*¦* `حظر بالرد `: لحظر وطرد عضو 
🔅*¦* `حظر + المعرف `: لحظر وطرد عضو 
🔅*¦* `الغاء الحظر `: لالغاء الحظر عن عضو 
📵*¦* `منع `: لمنع كلمه داخل المجموعه
🔅*¦* `الغاء منع `: لالغاء منع الكلمه  
🔇*¦* `كتم ` : لكتم عضو بواسطة الرد
🔅*¦* `الغاء الكتم`  : لالغاء الكتم بواسطة الرد
🔝*¦*ـ➖➖➖➖➖
🗯*¦* راسلني للاستفسار 💡↭ ]]..SUDO_USER
return sendMessage(msg.to.id, 1, 1, text, 1, 'md')
end
if matches[1]== 'م2' then
if not is_mod(msg) then return "🔅¦ للاداريين فقط 🎖" end
local text = [[
👨🏽‍✈️¦  اوامر الوضع للمجموعه ::

📮¦ـ➖➖➖➖➖
💭¦ ضع الترحيب + الكلمه  :↜ لوضع ترحيب  
💭¦ ضع قوانين :↜ لوضع قوانين 
💭¦ ضع وصف :↜ لوضع وصف  
💭¦ ضـع رابط :↜ لوضع الرابط  
💭¦ الـرابـط :↜  لعرض الرابط  
📮¦ـ➖➖➖➖➖

👨🏽‍💻¦  اوامر رؤية الاعدادات ::

🗯¦ القوانين : لعرض  القوانين 
🗯¦ الادمنيه : لعرض  الادمنيه 
🗯¦ المدراء : لعرض  الاداريين 
🗯¦ المكتومين :↜لعرض  المكتومين 
🗯¦ المطور : لعرض معلومات المطور 
🗯¦ معلوماتي :↜لعرض معلوماتك  
🗯¦ الحمايه : لعرض كل الاعدادات  
🗯¦ الوسائط : لعرض اعدادات الميديا 
🗯¦ الاعدادات : لعرض اعدادات المجموعه 
🗯¦ المجموعه : لعرض معلومات المجموعه 
➖➖➖➖➖➖➖
🗯¦ راسلني للاستفسار 💡↭ ]]..SUDO_USER
return sendMessage(msg.to.id, 1, 1, text, 1, 'md')
end
if matches[1]== 'م3' then
if not is_mod(msg) then return "🔅¦ للاداريين فقط 🎖" end
local text = [[
⚡️ اوامر حماية المجموعه ⚡️
🔅¦ـ➖➖➖➖➖ـ
🔅¦️ `قفل ┇ فتح `:  التعديل
🔅¦️ `قفل ┇ فتح `:  البصمات
🔅¦️ `قفل ┇ فتح `:  الــفيديو
🔅¦️ `قفل ┇ فتح `: الـصـوت 
🔅¦️ `قفل ┇ فتح `:  الـصــور 
🔅¦️ `قفل ┇ فتح` :  الملصقات
🔅¦️ `قفل ┇ فتح `:  المتحركه
🔅¦️ `قفل ┇ فتح` : الدردشه
🔅¦️ `قفل ┇ فتح `: الروابط
🔅¦️ `قفل ┇ فتح `: التاك
🔅¦️ `قفل ┇ فتح `: البوتات
🔅¦️ `قفل ┇ فتح `: البوتات بالطرد
🔅¦️ `قفل ┇ فتح `: الكلايش
🔅¦️ `قفل ┇ فتح `: التكرار
🔅¦️ `قفل ┇ فتح `:  التوجيه
🔅¦️ `قفل ┇ فتح `:  الانلاين
🔅¦️ `قفل ┇ فتح `: الجهات 
🔅¦️ `قفل ┇ فتح `: المجموعه 
🔅¦️ `قفل ┇ فتح` : الــكـــل
🔅¦ـ➖➖➖➖➖
📌¦ `تفعيل ┇ تعطيل `: الترحيب 
🗯¦ `تفعيل ┇ تعطيل `: الردود 
📢¦ `تفعيل ┇ تعطيل `: التحذير
🗨¦ `تفعيل ┇ تعطيل `: الايدي
🔅¦ـ➖➖➖➖➖
🗯¦ راسلني للاستفسار 💡↭ ]]..SUDO_USER
return sendMessage(msg.to.id, 1, 1, text, 1, 'md')
end
if matches[1]== 'م4' then
if not is_mod(msg) then return "🔅¦ للاداريين فقط 🎖" end
local text = [[
📍💭 اوامر اضافيه 🔹🚀🔹

🔅¦ـ➖➖➖➖➖
🕵🏻 معلوماتك الشخصيه 🙊
🔅¦ `اسمي` : لعرض اسمك 💯
🔅¦ `معرفي` : لعرض معرفك 💯
🔅¦ `ايديي` : لعرض ايديك 💯
🔅¦ `رقمي` : لعرض رقمك  💯
🔅¦ـ➖➖➖➖➖
🔅¦ اوامر التحشيش 😄
📌¦ `تحب` + (اسم الشخص)
📌¦ `بوس `+ (اسم الشخص) 
📌¦ `كول` + (اسم الشخص) 
📌¦ `كله + الرد` + (الكلام) 
🔅¦ـ➖➖➖➖➖

🗯¦ راسلني للاستفسار 💡↭ ]]..SUDO_USER
return sendMessage(msg.to.id, 1, 1, text, 1, 'md')
end
if matches[1]== "م المطور" then
if not is_sudo(msg) then return "🔅¦ للمطوين فقط 🎖" end
local text = [[
📌¦ اوامر المطور 🃏

🔅¦ `تفعيل` : لتفعيل البوت 
🔅¦ `تعطيل` : لتعطيل البوت 
🔅¦ `اذاعه` : لنشر كلمه لكل المجموعات
🔅¦ `اذاعه خاص` : لنشر كلمه لكل المشتركين خاص
🔅¦ `اذاعه عام` : لنشر كلمه لكل المجموعات والخاص
🔅¦` اسم بوتك + غادر :` لطرد البوت
🔅¦ `مسح الادمنيه` : لمسح الادمنيه 
🔅¦ `مسح المميزين` : لمسح الاعضاء المميزين 
🔅¦ `مسح المدراء` : لمسح المدراء 
🔅¦ `تحديث`: لتحديث ملفات البوت
🔅¦ `تحديث السورس`: لتحديث السورس الى اصدار احدث
🔅¦ـ➖➖➖➖➖

🗯¦ راسلني للاستفسار 💡↭ ]]..SUDO_USER
return sendMessage(msg.to.id, 1, 1, text, 1, 'md')
end
if matches[1]== 'اوامر الرد' then
if not is_owner(msg) then return "🔅¦ للمدراء فقط 🎖" end
local text = [[
🗯¦ جميع اوامر الردود 
🔅¦ـ➖➖➖➖➖
🔅¦ `الردود `: لعرض الردود المثبته
🔅¦ `اضف رد` : لأضافه رد جديد
🔅¦` مسح رد ` الرد المراد مسحه
🔅¦ `مسح الردود `: لمسح كل الردود
🔅¦ـ➖➖➖➖➖
🗯¦ راسلني للاستفسار 💡↭ ]]..SUDO_USER
return sendMessage(msg.to.id, 1, 1, text, 1, 'md')
end
if matches[1]== "اوامر الملفات" then
if not we_sudo(msg) then return "☔️هذا الاوامر للمطور الاساسي فقط 🌑" end
local text = [[☔️¦ اوامر الملفات 🌑

🔅¦ /p  لعرض قائمه الملفات السورس 🍃
🔅¦ /p + اسم الملف المراد تفعيله 🍃
🔅¦ /p - اسم الملف المراد تعطيله 🍃
🔅¦ sp + الاسم | لارسال الملف اليك 🍃
🔅¦ dp + اسم الملف المراد حذفه 🍃
🔅¦ sp all | لارسالك كل ملفات السورس 🍃

]]
return sendMessage(msg.to.id, 1, 1, text, 1, 'md')
end end end
return{patterns = {"^(م المطور)$", "^(اوامر الرد)$", "^(اوامر الملفات)$", "^(الاوامر)$", "^(م1)$", "^(م2)$", "^(م3)$", "^(م4)$", }, run = run,}
