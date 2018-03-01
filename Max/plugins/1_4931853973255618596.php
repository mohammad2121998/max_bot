<?php 
/*

*/
ob_start();
$API_KEY = "396333328:AAE7K-qRKs_RZbKFvIAYRt-dWpEHyeRCoVw";
echo "api.telegram.org/bot$API_KEY/setwebhook?url=".$_SERVER['SERVER_NAME']."".$_SERVER['SCRIPT_NAME'];
define('API_KEY',$API_KEY);
function bot($method,$datas=[]){
    $url = "https://api.telegram.org/bot".API_KEY."/".$method;
    $ch = curl_init();
    curl_setopt($ch,CURLOPT_URL,$url);
    curl_setopt($ch,CURLOPT_RETURNTRANSFER,true);
    curl_setopt($ch,CURLOPT_POSTFIELDS,$datas);
    $res = curl_exec($ch);
    if(curl_error($ch)){
        var_dump(curl_error($ch));
    }else{
        return json_decode($res);
    }
}
$update = json_decode(file_get_contents('php://input'));
$message = $update->message;
$chat_id = $message->chat->id;
$text = $message->text; 

$data = $update->callback_query->data;
$chat_id2 = $update->callback_query->message->chat->id;
$message_id2 = $update->callback_query->message->message_id;

$name = $message->from->first_name;
$username = $message->from->username;

$name2 = $update->callback_query->from->first_name;
$user2 = $update->callback_query->from->username;

$u = explode("\n",file_get_contents("memb.txt"));
$c = count($u);
  if ($text and $chat_id == 22729590) {
    bot('sendMessage',[
      'chat_id'=>$chat_id,
      'text'=>"مستخدمين البوت 🤖 الخاص بك :- $c"
    ]);
  }
if ($text == "/start"){
    bot('sendMessage',[
        'chat_id'=>$chat_id,
        'text'=>"اهلا بك : [$name](t.me/$username)
        مرحبا بكم بوت الترجمة, يمكنك من خلال البوت ترجمة الكلمة أو النص الذي تريده الى العديد من اللغات ، و البوت يعطيك رسالة صوتيه فيها طريقة نطق الكلمه او النص
        ",
        'disable_web_page_preview'=>true,
        'parse_mode'=>"markdown",
        'reply_markup'=>json_encode([
            'inline_keyboard'=>[
                [['text'=>"حول",'callback_data'=>"info"],['text'=>"كيفية الاستخدام",'callback_data'=>"play"]],
                [['text'=>"• ֆ Developer ֆ • ",'url'=>"https://t.me/joinchat/AAAAAEG5iF2Vl-1MM9suPA"]]
            ]
        ])
        ]);
}
if($data == "info"){
    bot('EditMessageText',[
        'chat_id'=>$chat_id2,
        'message_id'=>$message_id2,2,
        'text'=>"Version *1* \nMede By : [Abduallah Raad ViP](t.me/ths_56) \nChannel Bot : [• ֆ Developer ViP ֆ •](https://t.me/joinchat/AAAAAEG5iF2Vl-1MM9suPA)",
        'disable_web_page_preview'=>true,
        'parse_mode'=>"markdown",
        'reply_markup'=>json_encode([
            'inline_keyboard'=>[
                [['text'=>"رجوع",'callback_data'=>"back"]]
            ]
        ])
    ]);
}
if($data == "play"){
    bot('EditMessageText',[
        'chat_id'=>$chat_id2,
        'message_id'=>$message_id2,2,
        'text'=>"كل ما عليك القيام به هو إرسال الكلمة أو النص الذي تريد ترجمته و سوف نرسل لك رسالة اختر اللغة التي تريد ترجمة كلمة أو نص إليه وسيتم إرسال رسالة صوتيه فيها طريقة نطق الكلمه",
        'disable_web_page_preview'=>true,
        'parse_mode'=>"markdown",
        'reply_markup'=>json_encode([
            'inline_keyboard'=>[
                [['text'=>"رجوع",'callback_data'=>"back"]]
            ]
        ])
    ]);
}
if($data == "back"){
    bot('EditMessageText',[
        'chat_id'=>$chat_id2,
        'message_id'=>$message_id2,2,
        'text'=>"اهلا بك : [$name2](t.me/$user2)
        مرحبا بكم بوت الترجمة, يمكنك من خلال البوت ترجمة الكلمة أو النص الذي تريده الى العديد من اللغات ، و البوت يعطيك رسالة صوتيه فيها طريقة نطق الكلمه او النص",
        'disable_web_page_preview'=>true,
        'parse_mode'=>"markdown",
        'reply_markup'=>json_encode([
            'inline_keyboard'=>[
                [['text'=>"حول",'callback_data'=>"info"],['text'=>"كيفية الاستخدام",'callback_data'=>"play"]],
                [['text'=>"• ֆ Developer ֆ • ",'url'=>"https://t.me/joinchat/AAAAAEG5iF2Vl-1MM9suPA"]]
            ]
        ]) 
    ]);
}
if($text !="/start"){
    bot('sendMessage',[
        'chat_id'=>$chat_id,
        'text'=>"اختر اللغة التي ترجمة النص الخاص بك اليها .. ⚡️",
        'reply_markup'=>json_encode([
            'inline_keyboard'=>[
                [['text'=>"الأنكليزية 🇱🇷",'callback_data'=>"en&$text"],['text'=>"العربية 🇮🇶",'callback_data'=>"ar&$text"]],
                [['text'=>"الروسية 🇸🇰",'callback_data'=>"ru&$text"],['text'=>"الفارسية 🇮🇷",'callback_data'=>"fa&$text"]],
                [['text'=>"الأيطيالية 🇮🇪",'callback_data'=>"it&$text"],['text'=>"اليابانية 🇰🇷",'callback_data'=>"ja&$text"]],
                [['text'=>"الصينية 🇨🇳",'callback_data'=>"ch&$text"],['text'=>"الألمانية 🇩🇪",'callback_data'=>"gr&$text"]],
                [['text'=>"التركية 🇹🇷",'callback_data'=>"tu&$text"],['text'=>"الفرنسية 🇫🇷",'callback_data'=>"fr&$text"]],
                [['text'=>"الأوزبكية 🇬🇺",'callback_data'=>"oz&$text"],['text'=>"الهندية 🇮🇳",'callback_data'=>"in&$text"]],
                [['text'=>"الأوكرانية 🇨🇴",'callback_data'=>"ok&$text"],['text'=>"التايلاندية 🇨🇷",'callback_data'=>"ta&$text"]],
            ]
        ])
        ]);
}
if ($data) {
    $lang = explode('&', $data);
    $text = $lang[1];
    switch ($lang[0]) {
        case 'en':
        $word = json_decode(file_get_contents("https://translate.yandex.net/api/v1.5/tr.json/translate?key=trnsl.1.1.20170725T151635Z.31fe7a5603917164.915fed1f5a9aaebef43860694075516e7af7aa47&format=plain&lang=en&text=".urlencode($text)))->text[0];
            bot('editMessageText',[
                'chat_id'=>$chat_id2,'message_id'=>$message_id2,
                'text'=>$word
            ]);
            $voice = file_get_contents('http://tts.baidu.com/text2audio?lan=en&ie=UTF-8&text='.urlencode($word));
            file_put_contents('voice.ogg',$voice);
            bot('sendVoice',[
                'chat_id'=>$chat_id2,'message_id'=>$message_id2,
                'voice'=>new CURLFile('voice.ogg'),
                'caption'=>'اللفظ'
            ]);
            break;
        case 'ar':
            $word = json_decode(file_get_contents("https://translate.yandex.net/api/v1.5/tr.json/translate?key=trnsl.1.1.20170725T151635Z.31fe7a5603917164.915fed1f5a9aaebef43860694075516e7af7aa47&format=plain&lang=ar&text=".urlencode($text)))->text[0];
            bot('editMessageText',[
                'chat_id'=>$chat_id2,'message_id'=>$message_id2,
                'text'=>$word
            ]);
            $voice = file_get_contents('http://tts.baidu.com/text2audio?lan=ar&ie=UTF-8&text='.urlencode($word));
            file_put_contents('voice.ogg',$voice);
            bot('sendVoice',[
                'chat_id'=>$chat_id2,'message_id'=>$message_id2,
                'voice'=>new CURLFile('voice.ogg'),
                'caption'=>'اللفظ'
            ]);
            break;
        case 'ru':
            $word = json_decode(file_get_contents("https://translate.yandex.net/api/v1.5/tr.json/translate?key=trnsl.1.1.20170725T151635Z.31fe7a5603917164.915fed1f5a9aaebef43860694075516e7af7aa47&format=plain&lang=ru&text=".urlencode($text)))->text[0];
            bot('editMessageText',[
                'chat_id'=>$chat_id2,'message_id'=>$message_id2,
                'text'=>$word
            ]);
            $voice = file_get_contents('http://tts.baidu.com/text2audio?lan=ru&ie=UTF-8&text='.urlencode($word));
            file_put_contents('voice.ogg',$voice);
            bot('sendVoice',[
                'chat_id'=>$chat_id2,'message_id'=>$message_id2,
                'voice'=>new CURLFile('voice.ogg'),
                'caption'=>'اللفظ'
            ]);
            break;
        case 'fa':
            $word = json_decode(file_get_contents("https://translate.yandex.net/api/v1.5/tr.json/translate?key=trnsl.1.1.20170725T151635Z.31fe7a5603917164.915fed1f5a9aaebef43860694075516e7af7aa47&format=plain&lang=fa&text=".urlencode($text)))->text[0];
            bot('editMessageText',[
                'chat_id'=>$chat_id2,'message_id'=>$message_id2,
                'text'=>$word
            ]);
            $voice = file_get_contents('http://tts.baidu.com/text2audio?lan=fa&ie=UTF-8&text='.urlencode($word));
            file_put_contents('voice.ogg',$voice);
            bot('sendVoice',[
                'chat_id'=>$chat_id2,'message_id'=>$message_id2,
                'voice'=>new CURLFile('voice.ogg'),
                'caption'=>'اللفظ'
            ]);
            break;
        case 'it':
            $word = json_decode(file_get_contents("https://translate.yandex.net/api/v1.5/tr.json/translate?key=trnsl.1.1.20170725T151635Z.31fe7a5603917164.915fed1f5a9aaebef43860694075516e7af7aa47&format=plain&lang=it&text=".urlencode($text)))->text[0];
            bot('editMessageText',[
                'chat_id'=>$chat_id2,'message_id'=>$message_id2,
                'text'=>$word
            ]);
            $voice = file_get_contents('http://tts.baidu.com/text2audio?lan=it&ie=UTF-8&text='.urlencode($word));
            file_put_contents('voice.ogg',$voice);
            bot('sendVoice',[
                'chat_id'=>$chat_id2,'message_id'=>$message_id2,
                'voice'=>new CURLFile('voice.ogg'),
                'caption'=>'اللفظ'
            ]);
            break;
        case 'ja':
            $word = json_decode(file_get_contents("https://translate.yandex.net/api/v1.5/tr.json/translate?key=trnsl.1.1.20170725T151635Z.31fe7a5603917164.915fed1f5a9aaebef43860694075516e7af7aa47&format=plain&lang=ja&text=".urlencode($text)))->text[0];
            bot('editMessageText',[
                'chat_id'=>$chat_id2,'message_id'=>$message_id2,
                'text'=>$word
            ]);
            $voice = file_get_contents('http://tts.baidu.com/text2audio?lan=ja&ie=UTF-8&text='.urlencode($word));
            file_put_contents('voice.ogg',$voice);
            bot('sendVoice',[
                'chat_id'=>$chat_id2,'message_id'=>$message_id2,
                'voice'=>new CURLFile('voice.ogg'),
                'caption'=>'اللفظ'
            ]);
            break;
        case 'ch':
            $word = json_decode(file_get_contents("https://translate.yandex.net/api/v1.5/tr.json/translate?key=trnsl.1.1.20170725T151635Z.31fe7a5603917164.915fed1f5a9aaebef43860694075516e7af7aa47&format=plain&lang=ch&text=".urlencode($text)))->text[0];
            bot('editMessageText',[
                'chat_id'=>$chat_id2,'message_id'=>$message_id2,
                'text'=>$word
            ]);
            $voice = file_get_contents('http://tts.baidu.com/text2audio?lan=ch&ie=UTF-8&text='.urlencode($word));
            file_put_contents('voice.ogg',$voice);
            bot('sendVoice',[
                'chat_id'=>$chat_id2,'message_id'=>$message_id2,
                'voice'=>new CURLFile('voice.ogg'),
                'caption'=>'اللفظ'
            ]);
            break;
        case 'gr':
            $word = json_decode(file_get_contents("https://translate.yandex.net/api/v1.5/tr.json/translate?key=trnsl.1.1.20170725T151635Z.31fe7a5603917164.915fed1f5a9aaebef43860694075516e7af7aa47&format=plain&lang=gr&text=".urlencode($text)))->text[0];
            bot('editMessageText',[
                'chat_id'=>$chat_id2,'message_id'=>$message_id2,
                'text'=>$word
            ]);
            $voice = file_get_contents('http://tts.baidu.com/text2audio?lan=gr&ie=UTF-8&text='.urlencode($word));
            file_put_contents('voice.ogg',$voice);
            bot('sendVoice',[
                'chat_id'=>$chat_id2,'message_id'=>$message_id2,
                'voice'=>new CURLFile('voice.ogg'),
                'caption'=>'اللفظ'
            ]);
            break;
        case 'tu':
            $word = json_decode(file_get_contents("https://translate.yandex.net/api/v1.5/tr.json/translate?key=trnsl.1.1.20170725T151635Z.31fe7a5603917164.915fed1f5a9aaebef43860694075516e7af7aa47&format=plain&lang=tu&text=".urlencode($text)))->text[0];
            bot('editMessageText',[
                'chat_id'=>$chat_id2,'message_id'=>$message_id2,
                'text'=>$word
            ]);
            $voice = file_get_contents('http://tts.baidu.com/text2audio?lan=tu&ie=UTF-8&text='.urlencode($word));
            file_put_contents('voice.ogg',$voice);
            bot('sendVoice',[
                'chat_id'=>$chat_id2,'message_id'=>$message_id2,
                'voice'=>new CURLFile('voice.ogg'),
                'caption'=>'اللفظ'
            ]);
            break;
        case 'fr':
            $word = json_decode(file_get_contents("https://translate.yandex.net/api/v1.5/tr.json/translate?key=trnsl.1.1.20170725T151635Z.31fe7a5603917164.915fed1f5a9aaebef43860694075516e7af7aa47&format=plain&lang=fr&text=".urlencode($text)))->text[0];
            bot('editMessageText',[
                'chat_id'=>$chat_id2,'message_id'=>$message_id2,
                'text'=>$word
            ]);
            $voice = file_get_contents('http://tts.baidu.com/text2audio?lan=fr&ie=UTF-8&text='.urlencode($word));
            file_put_contents('voice.ogg',$voice);
            bot('sendVoice',[
                'chat_id'=>$chat_id2,'message_id'=>$message_id2,
                'voice'=>new CURLFile('voice.ogg'),
                'caption'=>'اللفظ'
            ]);
            break;
        case 'oz':
            $word = json_decode(file_get_contents("https://translate.yandex.net/api/v1.5/tr.json/translate?key=trnsl.1.1.20170725T151635Z.31fe7a5603917164.915fed1f5a9aaebef43860694075516e7af7aa47&format=plain&lang=oz&text=".urlencode($text)))->text[0];
            bot('editMessageText',[
                'chat_id'=>$chat_id2,'message_id'=>$message_id2,
                'text'=>$word
            ]);
            $voice = file_get_contents('http://tts.baidu.com/text2audio?lan=oz&ie=UTF-8&text='.urlencode($word));
            file_put_contents('voice.ogg',$voice);
            bot('sendVoice',[
                'chat_id'=>$chat_id2,'message_id'=>$message_id2,
                'voice'=>new CURLFile('voice.ogg'),
                'caption'=>'اللفظ'
            ]);
            break;
        case 'in':
            $word = json_decode(file_get_contents("https://translate.yandex.net/api/v1.5/tr.json/translate?key=trnsl.1.1.20170725T151635Z.31fe7a5603917164.915fed1f5a9aaebef43860694075516e7af7aa47&format=plain&lang=in&text=".urlencode($text)))->text[0];
            bot('editMessageText',[
                'chat_id'=>$chat_id2,'message_id'=>$message_id2,
                'text'=>$word
            ]);
            $voice = file_get_contents('http://tts.baidu.com/text2audio?lan=in&ie=UTF-8&text='.urlencode($word));
            file_put_contents('voice.ogg',$voice);
            bot('sendVoice',[
                'chat_id'=>$chat_id2,'message_id'=>$message_id2,
                'voice'=>new CURLFile('voice.ogg'),
                'caption'=>'اللفظ'
            ]);
            break;
        case 'ok':
            $word = json_decode(file_get_contents("https://translate.yandex.net/api/v1.5/tr.json/translate?key=trnsl.1.1.20170725T151635Z.31fe7a5603917164.915fed1f5a9aaebef43860694075516e7af7aa47&format=plain&lang=ok&text=".urlencode($text)))->text[0];
            bot('editMessageText',[
                'chat_id'=>$chat_id2,'message_id'=>$message_id2,
                'text'=>$word
            ]);
            $voice = file_get_contents('http://tts.baidu.com/text2audio?lan=ok&ie=UTF-8&text='.urlencode($word));
            file_put_contents('voice.ogg',$voice);
            bot('sendVoice',[
                'chat_id'=>$chat_id2,'message_id'=>$message_id2,
                'voice'=>new CURLFile('voice.ogg'),
                'caption'=>'اللفظ'
            ]);
            break;
        case 'ta':
            $word = json_decode(file_get_contents("https://translate.yandex.net/api/v1.5/tr.json/translate?key=trnsl.1.1.20170725T151635Z.31fe7a5603917164.915fed1f5a9aaebef43860694075516e7af7aa47&format=plain&lang=ta&text=".urlencode($text)))->text[0];
            bot('editMessageText',[
                'chat_id'=>$chat_id2,'message_id'=>$message_id2,
                'text'=>$word
            ]);
            $voice = file_get_contents('http://tts.baidu.com/text2audio?lan=ta&ie=UTF-8&text='.urlencode($word));
            file_put_contents('voice.ogg',$voice);
            bot('sendVoice',[
                'chat_id'=>$chat_id2,'message_id'=>$message_id2,
                'voice'=>new CURLFile('voice.ogg'),
                'caption'=>'اللفظ'
            ]);
            break;
    }
}