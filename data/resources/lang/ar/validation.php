<?php

$step2 = 'dec_';
$step3 = 'own_';
$step4 = 'own_cont_';
$step5 = 'ownership_';
$step6 = 'build_';
$step7 = 'unit_';

return [
    /*
      |--------------------------------------------------------------------------
      | Validation Language Lines
      |--------------------------------------------------------------------------
      |
      | The following language lines contain the default error messages used by
      | the validator class. Some of these rules have multiple versions such
      | as the size rules. Feel free to tweak each of these messages here.
      |
     */

    'accepted' => 'The :attribute must be accepted.',
    'active_url' => 'The :attribute is not a valid URL.',
    'after' => 'The :attribute must be a date after :date.',
    'after_or_equal' => 'The :attribute must be a date after or equal to :date.',
    'alpha' => 'The :attribute may only contain letters.',
    'alpha_dash' => 'The :attribute may only contain letters, numbers, and dashes.',
    'alpha_num' => 'The :attribute may only contain letters and numbers.',
    'array' => 'The :attribute must be an array.',
    'before' => 'The :attribute must be a date before :date.',
    'before_or_equal' => 'The :attribute must be a date before or equal to :date.',
    'between' => [
        'numeric' => 'The :attribute must be between :min and :max.',
        'file' => 'The :attribute must be between :min and :max kilobytes.',
        'string' => 'The :attribute must be between :min and :max characters.',
        'array' => 'The :attribute must have between :min and :max items.',
    ],
    'boolean' => 'The :attribute field must be true or false.',
    'confirmed' => 'The :attribute confirmation does not match.',
    'date' => 'The :attribute is not a valid date.',
    'date_format' => 'The :attribute does not match the format :format.',
    'different' => 'The :attribute and :other must be different.',
    'digits' => 'The :attribute must be :digits digits.',
    'digits_between' => 'The :attribute must be between :min and :max digits.',
    'dimensions' => 'The :attribute has invalid image dimensions.',
    'distinct' => 'The :attribute field has a duplicate value.',
    'email' => 'The :attribute must be a valid email address.',
    'exists' => 'The selected :attribute is invalid.',
    'file' => 'The :attribute must be a file.',
    'filled' => 'The :attribute field is required.',
    'image' => 'The :attribute must be an image.',
    'in' => 'The selected :attribute is invalid.',
    'in_array' => 'The :attribute field does not exist in :other.',
    'integer' => 'The :attribute must be an integer.',
    'ip' => 'The :attribute must be a valid IP address.',
    'json' => 'The :attribute must be a valid JSON string.',
    'max' => [
        'numeric' => 'The :attribute may not be greater than :max.',
        'file' => 'The :attribute may not be greater than :max kilobytes.',
        'string' => 'The :attribute may not be greater than :max characters.',
        'array' => 'The :attribute may not have more than :max items.',
    ],
    'mimes' => 'The :attribute must be a file of type: :values.',
    'mimetypes' => 'The :attribute must be a file of type: :values.',
    'min' => [
        'numeric' => 'The :attribute must be at least :min.',
        'file' => 'The :attribute must be at least :min kilobytes.',
        'string' => 'The :attribute must be at least :min characters.',
        'array' => 'The :attribute must have at least :min items.',
    ],
    'not_in' => 'The selected :attribute is invalid.',
    'numeric' => 'The :attribute must be a number.',
    'present' => 'The :attribute field must be present.',
    'regex' => 'The :attribute format is invalid.',
    'required' => 'The :attribute field is required.',
    'required_if' => 'The :attribute field is required when :other is :value.',
    'required_unless' => 'The :attribute field is required unless :other is in :values.',
    'required_with' => 'The :attribute field is required when :values is present.',
    'required_with_all' => 'The :attribute field is required when :values is present.',
    'required_without' => 'The :attribute field is required when :values is not present.',
    'required_without_all' => 'The :attribute field is required when none of :values are present.',
    'same' => 'The :attribute and :other must match.',
    'size' => [
        'numeric' => 'The :attribute must be :size.',
        'file' => 'The :attribute must be :size kilobytes.',
        'string' => 'The :attribute must be :size characters.',
        'array' => 'The :attribute must contain :size items.',
    ],
    'string' => 'The :attribute must be a string.',
    'timezone' => 'The :attribute must be a valid zone.',
    'unique' => 'The :attribute has already been taken.',
    'uploaded' => 'The :attribute failed to upload.',
    'url' => 'The :attribute format is invalid.',
    /*
      |--------------------------------------------------------------------------
      | Custom Validation Language Lines
      |--------------------------------------------------------------------------
      |
      | Here you may specify custom validation messages for attributes using the
      | convention "attribute.rule" to name the lines. This makes it quick to
      | specify a specific custom language line for a given attribute rule.
      |
     */
    'custom' => [
        'attribute-name' => [
            'rule-name' => 'custom-message',
        ],
        /*
         * step 2 validataion rules
         */
        $step2 . 'applicant_name' => [
            'required' => 'أسم مقدم الإقرار لا يمكن أن يكون فارغا.',
        ],
        $step2 . 'applicant_type' => [
            'required' => 'صفة مقدم الإقرار لا يمكن أن تكون فارغة.',
        ],
        $step2 . 'nationality' => [
            'required' => 'جنسية مقدم الإقرار لا يمكن أن تكون فارغة.',
        ],
        $step2 . 'nid' => [
            'required_if' => 'في حالة الجنسية المصرية, الرقم القومي لا يمكن أن يكون فارغا.',
            'min' => 'يرجى إدخال الرقم القومي 14 رقم كما هو مدون بالبطاقة.',
            'max' => 'يرجى إدخال الرقم القومي 14 رقم كما هو مدون بالبطاقة.',
        ],
        $step2 . 'passport_id' => [
            'required_unless' => 'في حالة الجنسية الأجنبية, رقم جواز السفر لا يمكن أن يكون فارغا.',
        ],
        $step2 . 'issue_date' => [
            'required' => ' تاريخ الإصدار لا يمكن أن يكون فارغا.',
            'before_or_equal' => 'تاريخ الإصدار غير صحيح (يجب أن يكون قبل تاريخ اليوم).'
        ],
        /*
         * step 3 validataion rules
         */
        $step3 . 'owner_name' => [
            'required' => 'أسم المالك لا يمكن أن يكون فارغا.',
        ],
        $step3 . 'owner_first_name' => [
            'required' => 'الإسم الأول للمالك لا يمكن أن يكون فارغا.',
        ],
        $step3 . 'owner_second_name' => [
            'required' => 'الإسم الثاني للمالك لا يمكن أن يكون فارغا.',
        ],
        $step3 . 'owner_third_name' => [
            'required' => 'الإسم الثالث للمالك لا يمكن أن يكون فارغا.',
        ],
        $step3 . 'owner_last_name' => [
            'required' => 'الإسم الأخير للمالك لا يمكن أن يكون فارغا.',
        ],
        $step3 . 'owner_middle_name' => [
            'required_if' => 'الإسم الأوسط للمالك لا يمكن أن يكون فارغا.',
        ],
        $step3 . 'owner_type' => [
            'required' => 'صفة المالك لا يمكن أن تكون فارغة.',
        ],
        $step3 . 'owner_id_img' => [
            'required' => 'صورة تحقيق هوية المالك لا يمكن أن تكون فارغة.',
            'image' => 'يجب ارفاق صورة.',
            'mimes' => 'نوع الصورة يجب ان يكون:(JPG, PNG, JPEG)',
            'max' => 'حجم الصورة لا يجب ان يتخطى 2 ميجا بايت.',
        ],
        $step3 . 'nationality' => [
            'required_if' => 'جنسية المالك لا يمكن أن تكون فارغة .',
        ],
        $step3 . 'issue_date' => [
            'required_if' => ' تاريخ الإصدار لا يمكن أن يكون فارغا.',
            'before_or_equal' => 'تاريخ الإصدار غير صحيح (يجب أن يكون قبل تاريخ اليوم).'
        ],
        $step3 . 'nid' => [
            'required_if' => 'في حالة الجنسية المصرية, الرقم القومي لا يمكن أن يكون فارغا.',
            'min' => 'يرجى إدخال الرقم القومي 14 رقم كما هو مدون بالبطاقة.',
            'max' => 'يرجى إدخال الرقم القومي 14 رقم كما هو مدون بالبطاقة.',
        ],
        $step3 . 'passport_id' => [
            'required_unless' => 'في حالة الجنسية الأجنبية, رقم جواز السفر لا يمكن أن يكون فارغا.',
        ],
        $step3 . 'birth_date' => [
            'required_unless' => 'تاريخ الميلاد لا يمكن أن يكون فارغا.',
            'before_or_equal' => 'تاريخ الميلاد غير صحيح (يجب أن يكون قبل تاريخ اليوم).'
        ],
        $step3 . 'comm_reg_office' => [
            'required_unless' => 'مكتب سجل تجاري لا يمكن أن يكون فارغا.',
        ],
        $step3 . 'license_type' => [
            'required_unless' => 'نوع الترخيص لا يمكن أن يكون فارغا.',
        ],
        $step3 . 'license_other_type' => [
            'required_if' => '',
        ],
        $step3 . 'tax_file_no' => [
            'required_unless' => 'رقم الملف الضريبي لا يمكن أن يكون فارغا.',
        ],
        $step3 . 'tax_reg_no' => [
            'required_unless' => 'رقم التسجيل الضريبي لا يمكن أن يكون فارغا.',
        ],
        $step3 . 'comm_reg_no' => [
            'required_unless' => 'رقم السجل التجاري لا يمكن أن يكون فارغا.',
        ],
        /*
         * step 4 owner contact
         */
        $step4 . 'email' => [
            'required' => 'البريد الإلكتروني لا يمكن أن يكون فارغا.',
            'email' => 'البريد الإلكتروني غير صحيح.',
        ],
        $step4 . 'mobile_no' => [
            'required' => 'رقم الموبيل لا يمكن أن يكون فارغا.',
            'min' => 'رقم الموبيل يجب ان يكون 11 رقما.',
            'min' => 'رقم الموبيل يجب ان يكون 11 رقما.',
        ],
        $step4 . 'address_type' => [
            'required' => 'نوع العنوان لا يمكن أن يكون فارغا.',
        ],
        $step4 . 'government' => [
            'required' => 'المحافظة لا يمكن أن تكون فارغة.',
        ],
        $step4 . 'district' => [
            'required' => 'حي / مركز أو قسم شرطة لا يمكن أن يكون فارغا.',
        ],
        $step4 . 'village_1' => [
            'required_if' => 'قرية / الشياخة لا يمكن أن يكون فارغا.',
        ],
        $step4 . 'street_1' => [
            'required_if' => 'الشارع لا يمكن أن يكون فارغا.',
        ],
        $step4 . 'bld_no_1' => [
            'required_if' => 'رقم العقار لا يمكن أن يكون فارغا.',
        ],
        $step4 . 'floor_no_1' => [
            'required_if' => 'رقم الدور لا يمكن أن يكون فارغا.',
        ],
        $step4 . 'unit_no_1' => [
            'required_if' => 'رقم الوحدة لا يمكن أن يكون فارغا.',
        ],
        $step4 . 'village_2' => [
            'required_if' => 'قرية / الشياخة لا يمكن أن يكون فارغا.',
        ],
        $step4 . 'street_2' => [
            'required_if' => 'الشارع لا يمكن أن يكون فارغا.',
        ],
        $step4 . 'bld_no_2' => [
            'required_if' => 'رقم العقار لا يمكن أن يكون فارغا.',
        ],
        $step4 . 'floor_no_2' => [
            'required_if' => 'رقم الدور لا يمكن أن يكون فارغا.',
        ],
        $step4 . 'unit_no_2' => [
            'required_if' => 'رقم الوحدة لا يمكن أن يكون فارغا.',
        ],
        $step4 . 'compound_name_3' => [
            'required_if' => 'إسم التجمع السكني لا يمكن أن يكون فارغا.',
        ],
        $step4 . 'unit_no_3' => [
            'required_if' => 'رقم الوحدة لا يمكن أن يكون فارغا.',
        ],
        $step4 . 'floor_no_3' => [
            'required_if' => 'رقم الدور لا يمكن أن يكون فارغا.',
        ],
        $step4 . 'bld_no_3' => [
            'required_if' => 'رقم العقار لا يمكن أن يكون فارغا.',
        ],
        $step4 . 'address' => [
            'required' => 'العنوان لا يمكن أن يكون فارغا.',
        ],
        /*
         * step 5 ownership
         */
        $step5 . 'address_type' => [
            'required' => 'نوع العنوان لا يمكن أن يكون فارغا.',
        ],
        $step5 . 'government' => [
            'required' => 'المحافظة لا يمكن أن تكون فارغة.',
        ],
        $step5 . 'district' => [
            'required' => 'حي / مركز أو قسم شرطة لا يمكن أن يكون فارغا.',
        ],
        $step5 . 'village_1' => [
            'required_if' => 'قرية / الشياخة لا يمكن أن يكون فارغا.',
        ],
        $step5 . 'street_1' => [
            'required_if' => 'الشارع لا يمكن أن يكون فارغا.',
        ],
        $step5 . 'bld_no_1' => [
            'required_if' => 'رقم العقار لا يمكن أن يكون فارغا.',
        ],
        $step5 . 'village_2' => [
            'required_if' => 'قرية / الشياخة لا يمكن أن يكون فارغا.',
        ],
        $step5 . 'street_2' => [
            'required_if' => 'الشارع لا يمكن أن يكون فارغا.',
        ],
        $step5 . 'bld_no_2' => [
            'required_if' => 'رقم العقار لا يمكن أن يكون فارغا.',
        ],
        $step5 . 'compound_name_3' => [
            'required_if' => 'إسم التجمع السكني لا يمكن أن يكون فارغا.',
        ],
        $step5 . 'bld_no_3' => [
            'required_if' => 'رقم العقار لا يمكن أن يكون فارغا.',
        ],
        $step5 . 'address' => [
            'required' => 'العنوان لا يمكن أن يكون فارغا.',
        ],
        /*
         * step 6 building
         */
        $step6 . 'no_of_floors' => [
            'required' => 'عدد الأدوار لا يمكن أن يكون فارغا.',
            'min' => 'عدد الأدوار يجب ان يكون (1) على الأقل.',
            'numeric' => 'عدد الأدوار يجب أن يكون رقم صحيح.'
        ],
        $step6 . 'units_per_floor' => [
            'required' => 'عدد الوحدات في كل دور لا يمكن أن يكون فارغا.',
            'min' => 'عدد الوحدات في كل دور يجب ان يكون (1) على الأقل.',
            'numeric' => 'عدد الوحدات في كل دور يجب أن يكون رقم صحيح.'
        ],
        $step6 . 'land_area' => [
            'required' => 'مساحة الأرض الكلية لا يمكن أن تكون فارغة.',
            'min' => 'مساحة الأرض الكلية يجب ان تكون (1) على الأقل.',
            'numeric' => 'مساحة الأرض الكلية يجب أن تكون رقم صحيح.'
        ],
        $step6 . 'build_area' => [
            'min' => ' المساحة المبنية للعقار يجب ان تكون (1) على الأقل.',
            'numeric' => 'المساحة المبنية للعقار يجب أن تكون رقم صحيح.'
        ],
        $step6 . 'build_age' => [
            'min' => ' عمر العقار بالسنوات يجب ان يكون (0) على الأقل.',
            'numeric' => 'عمر العقار بالسنوات يجب أن يكون رقم صحيح.'
        ],
        $step6 . 'build_finish_date' => [
            //'required' => ' تاريخ اتمام بناء العقار لا يمكن أن يكون فارغا.',
            'before_or_equal' => 'تاريخ اتمام بناء العقار غير صحيح (يجب أن يكون قبل تاريخ اليوم).'
        ],
        /*
         * step 7 unit
         */
        $step7 . 'floor_no' => [
            'required' => 'رقم الدور لا يمكن أن يكون فارغا.',
            'min' => 'رقم الدور يجب ان يكون (1) على الأقل.',
            'numeric' => 'رقم الدور يجب أن يكون رقم صحيح.'
        ],
        $step7 . 'unit_no' => [
            'required' => 'رقم الوحدة لا يمكن أن يكون فارغا.',
            'min' => 'رقم الوحدة يجب ان يكون (1) على الأقل.',
            'numeric' => 'رقم الوحدة يجب أن يكون رقم صحيح.'
        ],
        $step7 . 'unit_build_date' => [
            'required' => ' تاريخ إنشاء الوحدة لا يمكن أن يكون فارغا.',
            'before_or_equal' => 'تاريخ إنشاء الوحدة غير صحيح (يجب أن يكون قبل تاريخ اليوم).'
        ],
        $step7 . 'unit_type' => [
            'required' => 'نوع الوحدة لا يمكن أن يكون فارغا.',
        ],
        $step7 . 'unit_other_type' => [
            'required' => '',
        ],
        $step7 . 'unit_activity' => [
            'required' => 'نوع النشاط لا يمكن أن يكون فارغا.',
        ],
        $step7 . 'unit_other_activity' => [
            'required' => '',
        ],
        $step7 . 'unit_area' => [
            'required' => 'المساحة لا يمكن أن تكون فارغة.',
            'min' => 'المساحة يجب ان تكون (1) على الأقل.',
            'numeric' => 'المساحة يجب أن تكون رقم صحيح.'
        ],
        $step7 . 'comm_name' => [
            'required_unless' => 'الإسم التجاري لا يمكن ان يكون فارغا.',
        ],
        $step7 . 'tax_id_no' => [
            'required_unless' => 'رقم البطاقة الضريبية لا يمكن ان يكون فارغا.',
        ],
        $step7 . 'monthly_rental' => [
            'required_without_all' => 'القيمة الإيجارية الشهرية  لا يمكن أن تكون فارغة.',
            'min' => 'القيمة الإيجارية الشهرية  يجب ان تكون (1) على الأقل.',
            'numeric' => 'القيمة الإيجارية الشهرية  يجب أن تكون رقم صحيح.'
        ],
        $step7 . 'meter_price' => [
            'required_without_all' => 'سعر المتر لا يمكن أن يكون فارغا.',
            'min' => 'سعر المتر يجب ان يكون (1) على الأقل.',
            'numeric' => 'سعر المتر يجب أن يكون رقم صحيح.'
        ],
        $step7 . 'market_price' => [
            'required_without_all' => 'القيمة السوقية لا يمكن أن تكون فارغة.',
            'min' => 'القيمة السوقية يجب ان تكون (1) على الأقل.',
            'numeric' => 'القيمة السوقية يجب أن تكون رقم صحيح.'
        ],
        $step7 . 'contract_img' => [
            'image' => 'يجب ارفاق صورة.',
            'mimes' => 'نوع الصورة يجب ان يكون:(JPG, PNG, JPEG)',
            'max' => 'حجم الصورة لا يجب ان يتخطى 2 ميجا بايت.',
        ],
        $step7 . 'private_residence' => [
            'required' => 'السكن الخاص لا يمكن أن يكون فارغا.',
        ],
    ],
    /*
      |--------------------------------------------------------------------------
      | Custom Validation Attributes
      |--------------------------------------------------------------------------
      |
      | The following language lines are used to swap attribute place-holders
      | with something more reader friendly such as E-Mail Address instead
      | of "email". This simply helps us make messages a little cleaner.
      |
     */
    'attributes' => [],
];
