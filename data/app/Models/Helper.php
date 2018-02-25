<?php

namespace App\Models;

use \Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\Crypt;

class Helper {
    /*
     * Encrypt the given string
     * $param unhashed string
     * $return hashed string
     */

    public static function encryptAlgo($str) {
        return Crypt::encrypt($str, true);
    }

    /**
     * Decrypt the given hash
     * $param hashed string
     * $return unhashed string
     */
    public static function decryptAlgo($str) {
        return Crypt::decrypt($str, true);
    }

    /**
     * Used to send an email
     * @param type $from
     * @param type $toEmail
     * @param type $subject
     * @param string $message
     * @return type
     */
    public static function SendMail($from, $toEmail, $subject, $message) {
        $adminEmail = $from;
        $appName = trans('messages.' . config('app.name'));
        $locale = App::getLocale();
        $tableCss = in_array($locale, ['ar']) ? 'style="text-align:right; direction:rtl;"' : '';
        // To send HTML mail, the Content-type header must be set
        $headers = 'MIME-Version: 1.0' . "\r\n";
        $headers .= 'Content-type: text/html; charset=UTF-8' . "\r\n";
        $message = '<table ' . $tableCss . '>
                    <tr><td><p>' . trans('messages.Dear user') . ',</p><br>' . $message . '</td></tr>
                    <tr><td><br><label>' . trans('messages.Thank you') . '.</label></td></tr>
                  </table>';
        $headers .= 'To: <' . $toEmail . '>' . "\r\n";
        $headers .= 'From: ' . $appName . ' <' . $adminEmail . '>' . "\r\n";
        $sent = mail($toEmail, $subject, $message, $headers);
        return $sent;
    }

}
