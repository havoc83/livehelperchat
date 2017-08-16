<?php
ini_set('display_errors', 1);
error_reporting(E_ALL);

try {
    
    $cfgSite = erConfigClassLhConfig::getInstance();
    
    if ($cfgSite->getSetting('site', 'installed') == true) {
        $Params['module']['functions'] = array(
            'install'
        );
        include_once ('modules/lhkernel/nopermission.php');
        
        $Result['pagelayout'] = 'install';
        $Result['path'] = array(
            array(
                'title' => 'Live helper chat installation'
            )
        );
        return $Result;
        
        exit();
    }
    
    $instance = erLhcoreClassSystem::instance();
    
    if ($instance->SiteAccess != 'site_admin') {
        header('Location: ' . erLhcoreClassDesign::baseurldirect('site_admin/install/install'));
        exit();
    }
    
    $tpl = new erLhcoreClassTemplate('lhinstall/install1.tpl.php');
    
    switch ((int) $Params['user_parameters']['step_id']) {
        
        case '1':
            $Errors = array();
            if (! is_writable("cache/cacheconfig"))
                $Errors[] = "cache/cacheconfig is not writable";
            
            if (! is_writable("settings/"))
                $Errors[] = "settings/ is not writable";
            
            if (! is_writable("cache/translations"))
                $Errors[] = "cache/translations is not writable";
            
            if (! is_writable("cache/userinfo"))
                $Errors[] = "cache/userinfo is not writable";
            
            if (! is_writable("cache/compiledtemplates"))
                $Errors[] = "cache/compiledtemplates is not writable";
            
            if (! is_writable("var/storage"))
                $Errors[] = "var/storage is not writable";
            
            if (! is_writable("var/storageform"))
                $Errors[] = "var/storageform is not writable";
            
            if (! is_writable("var/userphoto"))
                $Errors[] = "var/userphoto is not writable";
            
            if (! is_writable("var/tmpfiles"))
                $Errors[] = "var/tmpfiles is not writable";
            
            if (! is_writable("var/storagetheme"))
                $Errors[] = "var/storagetheme is not writable";
            
            if (! is_writable("var/storageadmintheme"))
                $Errors[] = "var/storageadmintheme is not writable";
            
            if (! extension_loaded('pdo_mysql') || ! extension_loaded('pdo_pgsql'))
                $Errors[] = "php-pdo extension not detected. Please install php extension";
            
            if (! extension_loaded('curl'))
                $Errors[] = "php_curl extension not detected. Please install php extension";
            
            if (! extension_loaded('mbstring'))
                $Errors[] = "mbstring extension not detected. Please install php extension";
            
            if (! extension_loaded('gd'))
                $Errors[] = "gd extension not detected. Please install php extension";
            
            if (! function_exists('json_encode'))
                $Errors[] = "json support not detected. Please install php extension";
            
            if (version_compare(PHP_VERSION, '5.4.0', '<')) {
                $Errors[] = "Minimum 5.4.0 PHP version is required";
            }
            
            if (count($Errors) == 0) {
                $tpl->setFile('lhinstall/install2.tpl.php');
            }
            break;
        
        case '2':
            $Errors = array();
            
            $definition = array(
                'DatabaseDriver' => new ezcInputFormDefinitionElement(ezcInputFormDefinitionElement::REQUIRED, 'string'),
                'DatabaseUsername' => new ezcInputFormDefinitionElement(ezcInputFormDefinitionElement::REQUIRED, 'unsafe_raw'),
                'DatabasePassword' => new ezcInputFormDefinitionElement(ezcInputFormDefinitionElement::REQUIRED, 'unsafe_raw'),
                'DatabaseHost' => new ezcInputFormDefinitionElement(ezcInputFormDefinitionElement::REQUIRED, 'string'),
                'DatabasePort' => new ezcInputFormDefinitionElement(ezcInputFormDefinitionElement::REQUIRED, 'int'),
                'DatabaseDatabaseName' => new ezcInputFormDefinitionElement(ezcInputFormDefinitionElement::REQUIRED, 'string')
            );
            
            $form = new ezcInputForm(INPUT_POST, $definition);
            
            if (! $form->hasValidData('DatabaseUsername')) {
                $Errors[] = 'Please enter database username';
            }
            
            if (! $form->hasValidData('DatabasePassword')) {
                $Errors[] = 'Please enter database password';
            }
            
            if (! $form->hasValidData('DatabaseHost') || $form->DatabaseHost == '') {
                $Errors[] = 'Please enter database host';
            }
            
            if (! $form->hasValidData('DatabasePort') || $form->DatabasePort == '') {
                $Errors[] = 'Please enter database post';
            }
            
            if (! $form->hasValidData('DatabaseDatabaseName') || $form->DatabaseDatabaseName == '') {
                $Errors[] = 'Please enter database name';
            }
            
            if (count($Errors) == 0) {
                try {
                    $db = ezcDbFactory::create("{$form->DatabaseDriver}://{$form->DatabaseUsername}:{$form->DatabasePassword}@{$form->DatabaseHost}:{$form->DatabasePort}/{$form->DatabaseDatabaseName}");
                } catch (Exception $e) {
                    $Errors[] = 'Cannot login with provided logins. Returned message: <br/>' . $e->getMessage();
                }
            }
            
            if (count($Errors) == 0) {
                
                $cfgSite = erConfigClassLhConfig::getInstance();
                $cfgSite->setSetting('db', 'driver', $form->DatabaseDriver);
                $cfgSite->setSetting('db', 'host', $form->DatabaseHost);
                $cfgSite->setSetting('db', 'user', $form->DatabaseUsername);
                $cfgSite->setSetting('db', 'password', $form->DatabasePassword);
                $cfgSite->setSetting('db', 'database', $form->DatabaseDatabaseName);
                $cfgSite->setSetting('db', 'port', $form->DatabasePort);
                
                $cfgSite->setSetting('site', 'secrethash', substr(md5(time() . ":" . mt_rand()), 0, 10));
                
                $cfgSite->save();
                
                $tpl->setFile('lhinstall/install3.tpl.php');
            } else {
                $tpl->set('db_driver', $form->DatabaseDriver);
                $tpl->set('db_username', $form->DatabaseUsername);
                $tpl->set('db_password', $form->DatabasePassword);
                $tpl->set('db_host', $form->DatabaseHost);
                $tpl->set('db_port', $form->DatabasePort);
                $tpl->set('db_name', $form->DatabaseDatabaseName);
                $tpl->set('errors', $Errors);
                $tpl->setFile('lhinstall/install2.tpl.php');
            }
            break;
        
        case '3':
            
            $Errors = array();
            if ($_SERVER['REQUEST_METHOD'] == 'POST') {
                $definition = array(
                    'AdminUsername' => new ezcInputFormDefinitionElement(ezcInputFormDefinitionElement::REQUIRED, 'unsafe_raw'),
                    'AdminPassword' => new ezcInputFormDefinitionElement(ezcInputFormDefinitionElement::REQUIRED, 'unsafe_raw'),
                    'AdminPassword1' => new ezcInputFormDefinitionElement(ezcInputFormDefinitionElement::REQUIRED, 'unsafe_raw'),
                    'AdminEmail' => new ezcInputFormDefinitionElement(ezcInputFormDefinitionElement::REQUIRED, 'validate_email'),
                    'AdminName' => new ezcInputFormDefinitionElement(ezcInputFormDefinitionElement::OPTIONAL, 'unsafe_raw'),
                    'AdminSurname' => new ezcInputFormDefinitionElement(ezcInputFormDefinitionElement::OPTIONAL, 'unsafe_raw'),
                    'DefaultDepartament' => new ezcInputFormDefinitionElement(ezcInputFormDefinitionElement::REQUIRED, 'string')
                );
                
                $form = new ezcInputForm(INPUT_POST, $definition);
                
                if (! $form->hasValidData('AdminUsername') || $form->AdminUsername == '') {
                    $Errors[] = 'Please enter admin username';
                }
                
                if ($form->hasValidData('AdminUsername') && $form->AdminUsername != '' && strlen($form->AdminUsername) > 40) {
                    $Errors[] = 'Maximum 40 characters for admin username';
                }
                
                if (! $form->hasValidData('AdminPassword') || $form->AdminPassword == '') {
                    $Errors[] = 'Please enter admin password';
                }
                
                if ($form->hasValidData('AdminPassword') && $form->AdminPassword != '' && strlen($form->AdminPassword) > 40) {
                    $Errors[] = 'Maximum 40 characters for admin password';
                }
                
                if ($form->hasValidData('AdminPassword') && $form->AdminPassword != '' && strlen($form->AdminPassword) <= 40 && $form->AdminPassword1 != $form->AdminPassword) {
                    $Errors[] = 'Passwords missmatch';
                }
                
                if (! $form->hasValidData('AdminEmail')) {
                    $Errors[] = 'Wrong email address';
                }
                
                if (! $form->hasValidData('DefaultDepartament') || $form->DefaultDepartament == '') {
                    $Errors[] = 'Please enter default department name';
                }
                
                if (count($Errors) == 0) {
                    $tpl->set('admin_username', $form->AdminUsername);
                    $adminEmail = '';
                    if ($form->hasValidData('AdminEmail')) {
                        $tpl->set('admin_email', $form->AdminEmail);
                        $adminEmail = $form->AdminEmail;
                    }
                    $tpl->set('admin_name', $form->AdminName);
                    $tpl->set('admin_surname', $form->AdminSurname);
                    $tpl->set('admin_departament', $form->DefaultDepartament);
                    if ($cfgSite->getSetting('db', 'driver') == 'pgsql') {
                        $query = file_get_contents('doc/postgresql.sql');
                    } else {
                        $query = file_get_contents('doc/mysql.sql');
                    }
                    $db = ezcDbInstance::get();
                    $db->exec($query);
                    
                    $randomHash = erLhcoreClassModelForgotPassword::randomPassword(9);
                    $randomHashLength = strlen($randomHash);
                    $exportHash = erLhcoreClassModelForgotPassword::randomPassword(9);
                    
                    if (extension_loaded('bcmath')) {
                        $geoRow = "('geo_data','a:5:{i:0;b:0;s:21:\"geo_detection_enabled\";i:1;s:22:\"geo_service_identifier\";s:8:\"max_mind\";s:23:\"max_mind_detection_type\";s:7:\"country\";s:22:\"max_mind_city_location\";s:37:\"var/external/geoip/GeoLite2-City.mmdb\";}',0,'',1)";
                    } else {
                        $geoRow = "('geo_data', '', '0', '', '1')";
                    }
                    // This must be before insert into lh_chat_config
                    $db->query("INSERT INTO `lh_abstract_email_template` (`id`, `name`, `from_name`, `from_name_ac`, `from_email`, `from_email_ac`, `content`, `subject`, `subject_ac`, `reply_to`, `reply_to_ac`, `recipient`, `bcc_recipients`, `user_mail_as_sender`) VALUES
            	   (1,	'Send mail to user',	'Live Helper Chat',	0,	'',	0,	'Dear {user_chat_nick},\r\n\r\n{additional_message}\r\n\r\nLive Support response:\r\n{messages_content}\r\n\r\nSincerely,\r\nLive Support Team\r\n',	'{name_surname} has responded to your request',	1,	'',	1,	'',	'',	0),
            	   (2,	'Support request from user',	'',	0,	'',	0,	'Hello,\r\n\r\nUser request data:\r\nName: {name}\r\nEmail: {email}\r\nPhone: {phone}\r\nDepartment: {department}\r\nCountry: {country}\r\nCity: {city}\r\nIP: {ip}\r\n\r\nMessage:\r\n{message}\r\n\r\nAdditional data, if any:\r\n{additional_data}\r\n\r\nURL of page from which user has send request:\r\n{url_request}\r\n\r\nLink to chat if any:\r\n{prefillchat}\r\n\r\nSincerely,\r\nLive Support Team',	'{name}, {country}, {department}, Support request from user',	0,	'',	0,	'{$adminEmail}',	'',	0),
            	   (3,	'User mail for himself',	'Live Helper Chat',	0,	'',	0,	'Dear {user_chat_nick},\r\n\r\nTranscript:\r\n{messages_content}\r\nChat ID: {chat_id}\n\r\nSincerely,\r\nLive Support Team\r\n',	'Chat transcript',	0,	'',	0,	'',	'',	0),
            	   (4,	'New chat request',	'Live Helper Chat',	0,	'',	0,	'Hello,\r\n\r\nUser request data:\r\nName: {name}\r\nEmail: {email}\r\nPhone: {phone}\r\nDepartment: {department}\r\nCountry: {country}\r\nCity: {city}\r\nIP: {ip}\r\nCreated:	{created}\r\nUser left:	{user_left}\r\nWaited:	{waited}\r\nChat duration:	{chat_duration}\r\n\r\nMessage:\r\n{message}\r\n\r\nURL of page from which user has send request:\r\n{url_request}\r\n\r\nClick to accept chat automatically\r\n{url_accept}\r\n\r\nSurvey\r\n{survey}\r\n\r\nSincerely,\r\nLive Support Team',	'New chat request',	0,	'',	0,	'{$adminEmail}',	'',	0),
            	   (5,	'Chat was closed',	'Live Helper Chat',	0,	'',	0,	'Hello,\r\n\r\n{operator} has closed a chat\r\nName: {name}\r\nEmail: {email}\r\nPhone: {phone}\r\nDepartment: {department}\r\nCountry: {country}\r\nCity: {city}\r\nIP: {ip}\r\nCreated:	{created}\r\nUser left:	{user_left}\r\nWaited:	{waited}\r\nChat duration:	{chat_duration}\r\n\r\nMessage:\r\n{message}\r\n\r\nAdditional data, if any:\r\n{additional_data}\r\n\r\nURL of page from which user has send request:\r\n{url_request}\r\n\r\nSurvey:\r\n{survey}\r\n\r\nSincerely,\r\nLive Support Team',	'Chat was closed',	0,	'',	0,	'{$adminEmail}',	'',	0),
            	   (6,	'New FAQ question',	'Live Helper Chat',	0,	'',	0,	'Hello,\r\n\r\nNew FAQ question\r\nEmail: {email}\r\n\r\nQuestion:\r\n{question}\r\n\r\nQuestion URL:\r\n{url_question}\r\n\r\nURL to answer a question:\r\n{url_request}\r\n\r\nSincerely,\r\nLive Support Team',	'New FAQ question',	0,	'',	0,	'{$adminEmail}',	'',	0),
            	   (7,	'New unread message',	'Live Helper Chat',	0,	'',	0,	'Hello,\r\n\r\nUser request data:\r\nName: {name}\r\nEmail: {email}\r\nPhone: {phone}\r\nDepartment: {department}\r\nCountry: {country}\r\nCity: {city}\r\nIP: {ip}\r\nCreated:	{created}\r\nUser left:	{user_left}\r\nWaited:	{waited}\r\nChat duration:	{chat_duration}\r\n\r\nMessage:\r\n{message}\r\n\r\nURL of page from which user has send request:\r\n{url_request}\r\n\r\nClick to accept chat automatically\r\n{url_accept}\r\n\r\nSurvey:\r\n{survey}\r\n\r\nSincerely,\r\nLive Support Team',	'New unread message',	0,	'',	0,	'{$adminEmail}',	'',	0),
            	   (8,	'Filled form',	'MCFC',	0,	'',	0,	'Hello,\r\n\r\nUser has filled a form\r\nForm name - {form_name}\r\nUser IP - {ip}\r\nDownload filled data - {url_download}\r\nView filled data - {url_view}\r\n\r\n{content}\r\n\r\nSincerely,\r\nLive Support Team',	'Filled form - {form_name}',	0,	'',	0,	'{$adminEmail}',	'',	0),
            	   (9,	'Chat was accepted',	'Live Helper Chat',	0,	'',	0,	'Hello,\r\n\r\nOperator {user_name} has accepted a chat [{chat_id}]\r\n\r\nUser request data:\r\nName: {name}\r\nEmail: {email}\r\nPhone: {phone}\r\nDepartment: {department}\r\nCountry: {country}\r\nCity: {city}\r\nIP: {ip}\r\nCreated:	{created}\r\nUser left:	{user_left}\r\nWaited:	{waited}\r\nChat duration:	{chat_duration}\r\n\r\nMessage:\r\n{message}\r\n\r\nURL of page from which user has send request:\r\n{url_request}\r\n\r\nClick to accept chat automatically\r\n{url_accept}\r\n\r\nSurvey:\r\n{survey}\r\n\r\nSincerely,\r\nLive Support Team',	'Chat was accepted [{chat_id}]',	0,	'',	0,	'{$adminEmail}',	'',	0),
            	   (10,	'Permission request',	'Live Helper Chat',	0,	'',	0,	'Hello,\r\n\r\nOperator {user} has requested these permissions\n\r\n{permissions}\r\n\r\nSincerely,\r\nLive Support Team',	'Permission request from {user}',	0,	'',	0,	'',	'',	0),
            	   (11,	'You have unread messages',	'Live Helper Chat',	0,	'',	0,	'Hello,\r\n\r\nOperator {operator} has answered to you\r\n\r\n{messages}\r\n\r\nSincerely,\r\nLive Support Team',	'Operator has answered to your request',	0,	'',	0,	'',	'',	0);");
                    
                    $db->query("INSERT INTO `lh_chat_config` (`identifier`, `value`, `type`, `explain`, `hidden`) VALUES
                ('tracked_users_cleanup',	'160',	0,	'How many days keep records of online users.',	0),
        	   	('list_online_operators', '0', '0', 'List online operators.', '0'),
        	   	('voting_days_limit',	'7',	0,	'How many days voting widget should not be expanded after last show',	0),
                ('track_online_visitors',	'1',	0,	'Enable online site visitors tracking',	0),
        	   	('pro_active_invite',	'1',	0,	'Is pro active chat invitation active. Online users tracking also has to be enabled',	0),
                ('customer_company_name',	'Live Helper Chat',	0,	'Your company name - visible in bottom left corner',	0),
                ('customer_site_url',	'http://livehelperchat.com',	0,	'Your site URL address',	0),
                ('transfer_configuration','0','0','Transfer configuration','1'),
        	   	('smtp_data',	'a:5:{s:4:\"host\";s:0:\"\";s:4:\"port\";s:2:\"25\";s:8:\"use_smtp\";i:0;s:8:\"username\";s:0:\"\";s:8:\"password\";s:0:\"\";}',	0,	'SMTP configuration',	1),
        	    ('chatbox_data',	'a:6:{i:0;b:0;s:20:\"chatbox_auto_enabled\";i:0;s:19:\"chatbox_secret_hash\";s:{$randomHashLength}:\"{$randomHash}\";s:20:\"chatbox_default_name\";s:7:\"Chatbox\";s:17:\"chatbox_msg_limit\";i:50;s:22:\"chatbox_default_opname\";s:7:\"Manager\";}',	0,	'Chatbox configuration',	1),
                ('start_chat_data',	'a:23:{i:0;b:0;s:21:\"name_visible_in_popup\";b:1;s:27:\"name_visible_in_page_widget\";b:1;s:19:\"name_require_option\";s:8:\"required\";s:22:\"email_visible_in_popup\";b:0;s:28:\"email_visible_in_page_widget\";b:0;s:20:\"email_require_option\";s:8:\"required\";s:24:\"message_visible_in_popup\";b:1;s:30:\"message_visible_in_page_widget\";b:1;s:22:\"message_require_option\";s:8:\"required\";s:22:\"phone_visible_in_popup\";b:0;s:28:\"phone_visible_in_page_widget\";b:0;s:20:\"phone_require_option\";s:8:\"required\";s:21:\"force_leave_a_message\";b:0;s:29:\"offline_name_visible_in_popup\";b:1;s:35:\"offline_name_visible_in_page_widget\";b:1;s:27:\"offline_name_require_option\";s:8:\"required\";s:30:\"offline_phone_visible_in_popup\";b:0;s:36:\"offline_phone_visible_in_page_widget\";b:0;s:28:\"offline_phone_require_option\";s:8:\"required\";s:32:\"offline_message_visible_in_popup\";b:1;s:38:\"offline_message_visible_in_page_widget\";b:1;s:30:\"offline_message_require_option\";s:8:\"required\";}',	0,	'',	1),
                ('application_name',	'a:6:{s:3:\"eng\";s:31:\"Live Helper Chat - live support\";s:3:\"lit\";s:26:\"Live Helper Chat - pagalba\";s:3:\"hrv\";s:0:\"\";s:3:\"esp\";s:0:\"\";s:3:\"por\";s:0:\"\";s:10:\"site_admin\";s:31:\"Live Helper Chat - live support\";}',	1,	'Support application name, visible in browser title.',	0),
                ('track_footprint',	'0',	0,	'Track users footprint. For this also online visitors tracking should be enabled',	0),
                ('pro_active_limitation',	'-1',	0,	'Pro active chats invitations limitation based on pending chats, (-1) do not limit, (0,1,n+1) number of pending chats can be for invitation to be shown.',	0),
                ('pro_active_show_if_offline',	'0',	0,	'Should invitation logic be executed if there is no online operators',	0),
                ('export_hash',	'{$exportHash}',	0,	'Chats export secret hash',	0),
                ('message_seen_timeout', 24, 0, 'Proactive message timeout in hours. After how many hours proactive chat mesasge should be shown again.',	0),
                ('reopen_chat_enabled',1,	0,	'Reopen chat functionality enabled',	0),
                ('ignorable_ip',	'',	0,	'Which ip should be ignored in online users list, separate by comma',0),
                ('run_departments_workflow', 0, 0, 'Should cronjob run departments transfer workflow, even if user leaves a chat',	0),
                ('geo_location_data', 'a:3:{s:4:\"zoom\";i:4;s:3:\"lat\";s:7:\"49.8211\";s:3:\"lng\";s:7:\"11.7835\";}', '0', '', '1'),
                ('xmp_data','a:14:{i:0;b:0;s:4:\"host\";s:15:\"talk.google.com\";s:6:\"server\";s:9:\"gmail.com\";s:8:\"resource\";s:6:\"xmpphp\";s:4:\"port\";s:4:\"5222\";s:7:\"use_xmp\";i:0;s:8:\"username\";s:0:\"\";s:8:\"password\";s:0:\"\";s:11:\"xmp_message\";s:98:\"New chat request [{chat_id}] from [{department}]\r\n{messages}\r\nClick to accept a chat\r\n{url_accept}\";s:10:\"recipients\";s:0:\"\";s:20:\"xmp_accepted_message\";s:89:\"{user_name} has accepted a chat [{chat_id}] from [{department}]\r\n{messages}\r\n{url_accept}\";s:16:\"use_standard_xmp\";i:0;s:15:\"test_recipients\";s:0:\"\";s:21:\"test_group_recipients\";s:0:\"\";}',0,'XMP data',1),
                ('run_unaswered_chat_workflow', 0, 0, 'Should cronjob run unanswered chats workflow and execute unaswered chats callback, 0 - no, any other number bigger than 0 is a minits how long chat have to be not accepted before executing callback.',0),
                ('disable_popup_restore', 0, 0, 'Disable option in widget to open new window. Restore icon will be hidden',	0),
                ('accept_tos_link', '#', 0, 'Change to your site Terms of Service', 0),
                ('hide_button_dropdown', '0', 0, 'Hide close button in dropdown', 0),
                ('on_close_exit_chat', '0', 0, 'On chat close exit chat', 0),
                ('activity_timeout', '5', 0, 'How long operator should go offline automatically because of inactivity. Value in minutes', 0),
                ('product_enabled_module','0','0','Product module is enabled', '1'),
                ('product_show_departament','0','0','Enable products show by departments', '1'),
                ('paidchat_data','','0','Paid chat configuration','1'),
                ('disable_iframe_sharing',	'1',	0,	'Disable iframes in sharing mode',	0),
                ('file_configuration',	'a:7:{i:0;b:0;s:5:\"ft_op\";s:43:\"gif|jpe?g|png|zip|rar|xls|doc|docx|xlsx|pdf\";s:5:\"ft_us\";s:26:\"gif|jpe?g|png|doc|docx|pdf\";s:6:\"fs_max\";i:2048;s:18:\"active_user_upload\";b:0;s:16:\"active_op_upload\";b:1;s:19:\"active_admin_upload\";b:1;}',	0,	'Files configuration item',	1),
                ('accept_chat_link_timeout',	'300',	0,	'How many seconds chat accept link is valid. Set 0 to force login all the time manually.',	0),
                ('session_captcha',0,	0,	'Use session captcha. LHC have to be installed on the same domain or subdomain.',	0),
                ('sync_sound_settings',	'a:16:{i:0;b:0;s:12:\"repeat_sound\";i:1;s:18:\"repeat_sound_delay\";i:5;s:10:\"show_alert\";b:0;s:22:\"new_chat_sound_enabled\";b:1;s:31:\"new_message_sound_admin_enabled\";b:1;s:30:\"new_message_sound_user_enabled\";b:1;s:14:\"online_timeout\";d:300;s:22:\"check_for_operator_msg\";d:10;s:21:\"back_office_sinterval\";d:10;s:22:\"chat_message_sinterval\";d:3.5;s:20:\"long_polling_enabled\";b:0;s:30:\"polling_chat_message_sinterval\";d:1.5;s:29:\"polling_back_office_sinterval\";d:5;s:18:\"connection_timeout\";i:30;s:28:\"browser_notification_message\";b:0;}',	0,	'',	1),
                ('sound_invitation', 1, 0, 'Play sound on invitation to chat.',	0),
                ('explicit_http_mode', '',0,'Please enter explicit http mode. Either http: or https:, do not forget : at the end.', '0'),
                ('track_domain',	'',	0,	'Set your domain to enable user tracking across different domain subdomains.',	0),
                ('max_message_length','500',0,'Maximum message length in characters', '0'),
                ('need_help_tip','1',0,'Show need help tooltip?', '0'),
                ('need_help_tip_timeout','24',0,'Need help tooltip timeout, after how many hours show again tooltip?', '0'),
                ('use_secure_cookie','0',0,'Use secure cookie, check this if you want to force SSL all the time', '0'),
                ('faq_email_required','0',0,'Is visitor e-mail required for FAQ', '0'),
                ('disable_print','0',0,'Disable chat print', '0'),
                ('hide_disabled_department','1',0,'Hide disabled department widget', '0'),
                ('disable_send','0',0,'Disable chat transcript send', '0'),
                ('ignore_user_status','0',0,'Ignore users online statuses and use departments online hours', '0'),
                ('bbc_button_visible','1',0,'Show BB Code button', '0'),
                ('activity_track_all','0','0','Track all logged operators activity and ignore their individual settings.','0'),
                ('allow_reopen_closed','1', 0, 'Allow user to reopen closed chats?', '0'),
                ('reopen_as_new','1', 0, 'Reopen closed chat as new? Otherwise it will be reopened as active.', '0'),
                ('default_theme_id','0', 0, 'Default theme ID.', '1'),
                ('default_admin_theme_id','0', 0, 'Default admin theme ID', '1'),
                ('translation_data',	'a:6:{i:0;b:0;s:19:\"translation_handler\";s:4:\"bing\";s:19:\"enable_translations\";b:0;s:14:\"bing_client_id\";s:0:\"\";s:18:\"bing_client_secret\";s:0:\"\";s:14:\"google_api_key\";s:0:\"\";}',	0,	'Translation data',	1),
                ('disable_html5_storage','1',0,'Disable HMTL5 storage, check it if your site is switching between http and https', '0'),
                ('automatically_reopen_chat','1',0,'Automatically reopen chat on widget open', '0'),
                ('autoclose_timeout','0', 0, 'Automatic chats closing. 0 - disabled, n > 0 time in minutes before chat is automatically closed', '0'),
                ('autopurge_timeout','0', 0, 'Automatic chats purging. 0 - disabled, n > 0 time in minutes before chat is automatically deleted', '0'),
                ('update_ip',	'127.0.0.1',	0,	'Which ip should be allowed to update DB by executing http request, separate by comma?',0),
                ('track_if_offline',	'0',	0,	'Track online visitors even if there is no online operators',0),
                ('min_phone_length','8',0,'Minimum phone number length',0),
                ('mheight','',0,'Messages box height',0),
                ('inform_unread_message','0',0,'Inform visitor about unread messages from operator, value in minutes. 0 - disabled',0),
                ('dashboard_order', '[[\"online_operators\",\"departments_stats\",\"online_visitors\"],[\"pending_chats\",\"unread_chats\",\"transfered_chats\"],[\"active_chats\",\"closed_chats\"]]', '0', 'Home page dashboard widgets order', '0'),
                ('banned_ip_range','',0,'Which ip should not be allowed to chat',0),
                ('suggest_leave_msg','1',0,'Suggest user to leave a message then user chooses offline department',0),
                ('checkstatus_timeout','0',0,'Interval between chat status checks in seconds, 0 disabled.',0),
                ('show_language_switcher','0',0,'Show users option to switch language at widget',0),
                ('sharing_auto_allow','0',0,'Do not ask permission for users to see their screen',0),
                ('sharing_nodejs_enabled','0',0,'NodeJs support enabled',0),
                ('sharing_nodejs_path','',0,'socket.io path, optional',0),
                ('online_if','0','0','','0'),
                ('track_mouse_activity','0','0','Should mouse movement be tracked as activity measure, if not checked only basic events would be tracked','0'),
                ('track_activity','0','0','Track users activity on site?','0'),
                ('autologin_data','a:3:{i:0;b:0;s:11:\"secret_hash\";s:16:\"please_change_me\";s:7:\"enabled\";i:0;}',0,'Autologin configuration data',	1),
                ('sharing_nodejs_secure','0',0,'Connect to NodeJs in https mode',0),
                ('disable_js_execution','1',0,'Disable JS execution in Co-Browsing operator window',0),
                ('sharing_nodejs_socket_host','',0,'Host where NodeJs is running',0),
                ('hide_right_column_frontpage','0','0','Hide right column in frontpage','0'),
                ('front_tabs', 'dashboard,online_users,online_map', '0', 'Home page tabs order', '0'),
                ('speech_data',	'a:3:{i:0;b:0;s:8:\"language\";i:7;s:7:\"dialect\";s:5:\"en-US\";}',	1,	'',	1),
                ('sharing_nodejs_sllocation','https://cdn.socket.io/socket.io-1.1.0.js',0,'Location of SocketIO JS library',0),
                ('track_is_online','0',0,'Track is user still on site, chat status checks also has to be enabled',0),
				('show_languages','eng,lit,hrv,esp,por,nld,ara,ger,pol,rus,ita,fre,chn,cse,nor,tur,vnm,idn,sve,per,ell,dnk,rou,bgr,tha,geo,fin,alb',0,'Between what languages user should be able to switch',0),
                ('geoadjustment_data',	'a:8:{i:0;b:0;s:18:\"use_geo_adjustment\";b:0;s:13:\"available_for\";s:0:\"\";s:15:\"other_countries\";s:6:\"custom\";s:8:\"hide_for\";s:0:\"\";s:12:\"other_status\";s:7:\"offline\";s:11:\"rest_status\";s:6:\"hidden\";s:12:\"apply_widget\";i:0;}',	0,	'Geo adjustment settings',	1),
                {$geoRow}");
                    
                    $Departament = new erLhcoreClassModelDepartament();
                    $Departament->name = $form->DefaultDepartament;
                    erLhcoreClassDepartament::getSession()->save($Departament);
                    
                    // Admin group
                    $GroupData = new erLhcoreClassModelGroup();
                    $GroupData->name = "Administrators";
                    erLhcoreClassUser::getSession()->save($GroupData);
                    
                    // Precreate operators group
                    $GroupDataOperators = new erLhcoreClassModelGroup();
                    $GroupDataOperators->name = "Operators";
                    erLhcoreClassUser::getSession()->save($GroupDataOperators);
                    
                    // Administrators role
                    $Role = new erLhcoreClassModelRole();
                    $Role->name = 'Administrators';
                    erLhcoreClassRole::getSession()->save($Role);
                    
                    // Operators role
                    $RoleOperators = new erLhcoreClassModelRole();
                    $RoleOperators->name = 'Operators';
                    erLhcoreClassRole::getSession()->save($RoleOperators);
                    
                    // Assign admin role to admin group
                    $GroupRole = new erLhcoreClassModelGroupRole();
                    $GroupRole->group_id = $GroupData->id;
                    $GroupRole->role_id = $Role->id;
                    erLhcoreClassRole::getSession()->save($GroupRole);
                    
                    // Assign operators role to operators group
                    $GroupRoleOperators = new erLhcoreClassModelGroupRole();
                    $GroupRoleOperators->group_id = $GroupDataOperators->id;
                    $GroupRoleOperators->role_id = $RoleOperators->id;
                    erLhcoreClassRole::getSession()->save($GroupRoleOperators);
                    
                    $UserData = new erLhcoreClassModelUser();
                    
                    $UserData->setPassword($form->AdminPassword);
                    $UserData->email = $form->AdminEmail;
                    $UserData->name = $form->AdminName;
                    $UserData->surname = $form->AdminSurname;
                    $UserData->username = $form->AdminUsername;
                    $UserData->all_departments = 1;
                    $UserData->departments_ids = 0;
                    
                    erLhcoreClassUser::getSession()->save($UserData);
                    
                    $GroupUser = new erLhcoreClassModelGroupUser();
                    $GroupUser->group_id = $GroupData->id;
                    $GroupUser->user_id = $UserData->id;
                    erLhcoreClassUser::getSession()->save($GroupUser);
                    
                    // Admin role and function
                    $RoleFunction = new erLhcoreClassModelRoleFunction();
                    $RoleFunction->role_id = $Role->id;
                    $RoleFunction->module = '*';
                    $RoleFunction->function = '*';
                    erLhcoreClassRole::getSession()->save($RoleFunction);
                    
                    // Operators rules and functions
                    $permissionsArray = array(
                        array(
                            'module' => 'lhuser',
                            'function' => 'selfedit'
                        ),
                        array(
                            'module' => 'lhuser',
                            'function' => 'changeonlinestatus'
                        ),
                        array(
                            'module' => 'lhuser',
                            'function' => 'changeskypenick'
                        ),
                        array(
                            'module' => 'lhuser',
                            'function' => 'personalcannedmsg'
                        ),
                        array(
                            'module' => 'lhuser',
                            'function' => 'change_visibility_list'
                        ),
                        array(
                            'module' => 'lhuser',
                            'function' => 'see_assigned_departments'
                        ),
                        array(
                            'module' => 'lhuser',
                            'function' => 'canseedepartmentstats'
                        ),
                        array(
                            'module' => 'lhchat',
                            'function' => 'use'
                        ),
                        array(
                            'module' => 'lhchat',
                            'function' => 'chattabschrome'
                        ),
                        array(
                            'module' => 'lhchat',
                            'function' => 'singlechatwindow'
                        ),
                        array(
                            'module' => 'lhchat',
                            'function' => 'allowopenremotechat'
                        ),
                        array(
                            'module' => 'lhchat',
                            'function' => 'allowchattabs'
                        ),
                        array(
                            'module' => 'lhchat',
                            'function' => 'use_onlineusers'
                        ),
                        array(
                            'module' => 'lhchat',
                            'function' => 'take_screenshot'
                        ),
                        array(
                            'module' => 'lhfront',
                            'function' => 'use'
                        ),
                        array(
                            'module' => 'lhsystem',
                            'function' => 'use'
                        ),
                        array(
                            'module' => 'lhtranslation',
                            'function' => 'use'
                        ),
                        array(
                            'module' => 'lhchat',
                            'function' => 'allowblockusers'
                        ),
                        array(
                            'module' => 'lhsystem',
                            'function' => 'generatejs'
                        ),
                        array(
                            'module' => 'lhsystem',
                            'function' => 'changelanguage'
                        ),
                        array(
                            'module' => 'lhchat',
                            'function' => 'allowredirect'
                        ),
                        array(
                            'module' => 'lhchat',
                            'function' => 'allowtransfer'
                        ),
                        array(
                            'module' => 'lhchat',
                            'function' => 'allowtransferdirectly'
                        ),
                        array(
                            'module' => 'lhchat',
                            'function' => 'administratecannedmsg'
                        ),
                        array(
                            'module' => 'lhchat',
                            'function' => 'sees_all_online_visitors'
                        ),
                        array(
                            'module' => 'lhpermission',
                            'function' => 'see_permissions'
                        ),
                        array(
                            'module' => 'lhquestionary',
                            'function' => 'manage_questionary'
                        ),
                        array(
                            'module' => 'lhfaq',
                            'function' => 'manage_faq'
                        ),
                        array(
                            'module' => 'lhchatbox',
                            'function' => 'manage_chatbox'
                        ),
                        array(
                            'module' => 'lhbrowseoffer',
                            'function' => 'manage_bo'
                        ),
                        array(
                            'module' => 'lhxml',
                            'function' => '*'
                        ),
                        array(
                            'module' => 'lhcobrowse',
                            'function' => 'browse'
                        ),
                        array(
                            'module' => 'lhfile',
                            'function' => 'use_operator'
                        ),
                        array(
                            'module' => 'lhfile',
                            'function' => 'file_delete_chat'
                        ),
                        array(
                            'module' => 'lhstatistic',
                            'function' => 'use'
                        ),
                        array(
                            'module' => 'lhspeech',
                            'function' => 'changedefaultlanguage'
                        ),
                        array(
                            'module' => 'lhspeech',
                            'function' => 'use'
                        ),
                        array(
                            'module' => 'lhcannedmsg',
                            'function' => 'use'
                        ),
                        array(
                            'module' => 'lhspeech',
                            'function' => 'change_chat_recognition'
                        )
                    );
                    
                    foreach ($permissionsArray as $paramsPermission) {
                        $RoleFunctionOperator = new erLhcoreClassModelRoleFunction();
                        $RoleFunctionOperator->role_id = $RoleOperators->id;
                        $RoleFunctionOperator->module = $paramsPermission['module'];
                        $RoleFunctionOperator->function = $paramsPermission['function'];
                        erLhcoreClassRole::getSession()->save($RoleFunctionOperator);
                    }
                    
                    $cfgSite = erConfigClassLhConfig::getInstance();
                    $cfgSite->setSetting('site', 'installed', true);
                    $cfgSite->setSetting('site', 'templatecache', true);
                    $cfgSite->setSetting('site', 'templatecompile', true);
                    $cfgSite->setSetting('site', 'modulecompile', true);
                    $cfgSite->save();
                    
                    $tpl->setFile('lhinstall/install4.tpl.php');
                } else {
                    
                    $tpl->set('admin_username', $form->AdminUsername);
                    if ($form->hasValidData('AdminEmail'))
                        $tpl->set('admin_email', $form->AdminEmail);
                    $tpl->set('admin_name', $form->AdminName);
                    $tpl->set('admin_surname', $form->AdminSurname);
                    $tpl->set('admin_departament', $form->DefaultDepartament);
                    
                    $tpl->set('errors', $Errors);
                    
                    $tpl->setFile('lhinstall/install3.tpl.php');
                }
            } else {
                $tpl->setFile('lhinstall/install3.tpl.php');
            }
            
            break;
        
        case '4':
            $tpl->setFile('lhinstall/install4.tpl.php');
            break;
        
        default:
            $tpl->setFile('lhinstall/install1.tpl.php');
            break;
    }
    
    $Result['content'] = $tpl->fetch();
    $Result['pagelayout'] = 'install';
    $Result['path'] = array(
        array(
            'title' => 'Live helper chat installation'
        )
    );
} catch (Exception $e) {
    echo "Make sure that &quot;cache/*&quot; is writable and then <a href=\"" . erLhcoreClassDesign::baseurl('install/install') . "\">try again</a>";
    
    echo "<pre>";
    print_r($e);
    echo "</pre>";
    exit();
}
?>
