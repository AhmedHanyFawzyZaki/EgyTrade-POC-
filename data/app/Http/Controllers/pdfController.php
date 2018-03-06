<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class MYPDF extends \TCPDF {

    //Page header
    public $check = 0;

    public function Header() {
        // Logo
        $image_file = base_path('../files/img/logo.png');
        $this->Image($image_file, 70, 5, 55, '', 'png', '', 'N', false, 300, '', false, false, 0, false, false, false);
        $this->SetFont('majalla', 'B', 20);
        // Title
        //$this->Cell(0, 15, 'test', 0, false, 'R', 0, '', 0, false, 'M', 'M');
        $txt = 'اذن الافراج المبدئي';
        if ($this->check) {
            $txt = 'إذن الافراج النهائي';
        }

        $this->Text(10, 9, $txt);
    }

    // Page footer
    public function Footer() {
        // Position at 15 mm from bottom
        $this->SetY(-15);
        // Set font
        $this->SetFont('majalla', 'I', 12);
        // Page number
        $this->Cell(0, 10, 'صفحة ' . $this->getAliasNumPage() . '/' . $this->getAliasNbPages(), 0, false, 'C', 0, '', 0, false, 'T', 'M');
    }

}

class pdfController extends Controller {

    function index($id, $check = null) {
        $application = \App\Models\Applications::find($id);
        $username = \App\Models\User::find($application->created_by)->username;
        //	dd(\App\Models\User::find($application->created_by)->username);
        $barCode = $application->sad_num;
        //return view('pdf', ['application' => $application]);
        $contents = view('pdf', ['application' => $application, 'username' => $username])->render();
        //var_dump($contents);
        $pdf = new MYPDF(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);
// set document information
        if ($check == 1)
            $pdf->check = 1;

        $pdf->SetCreator(PDF_CREATOR);
        $pdf->SetAuthor('EgyTrade');
        $pdf->SetTitle('Initial SAD Number');
        $pdf->SetSubject('Initial SAD Number');
        $pdf->SetKeywords('PDF, guide');

        // set default header data
//        $pdf->SetHeaderData(PDF_HEADER_LOGO, PDF_HEADER_LOGO_WIDTH, PDF_HEADER_TITLE . ' 006', PDF_HEADER_STRING);
        // set header and footer fonts
        $pdf->setHeaderFont(Array(PDF_FONT_NAME_MAIN, '', PDF_FONT_SIZE_MAIN));
        $pdf->setFooterFont(Array(PDF_FONT_NAME_DATA, '', PDF_FONT_SIZE_DATA));
        $pdf->setRTL(true);
        // set default monospaced font
        $pdf->SetDefaultMonospacedFont(PDF_FONT_MONOSPACED);
        $pdf->SetMargins(10, 23, 10, true);
        // set margins
        // $pdf->SetMargins(PDF_MARGIN_LEFT, PDF_MARGIN_TOP, PDF_MARGIN_RIGHT);
        $pdf->SetHeaderMargin(PDF_MARGIN_HEADER);
        $pdf->SetFooterMargin(PDF_MARGIN_FOOTER);
        // set auto page breaks
        $style = array(
            'border' => 2,
            'vpadding' => 'auto',
            'hpadding' => 'auto',
            'fgcolor' => array(0, 0, 0),
            'bgcolor' => false, //array(255,255,255)
            'module_width' => 1, // width of a single module in points
            'module_height' => 1 // height of a single module in points
        );

        $pdf->SetAutoPageBreak(TRUE, PDF_MARGIN_BOTTOM);

        // set image scale factor
        $pdf->setImageScale(PDF_IMAGE_SCALE_RATIO);

        $pdf->SetFont('majalla', '', 14, '', false);
        $pdf->AddPage();
//$pdf->write1DBarcode($barCode, 'C39', 80, 30, 50, 15, $style, 'N');
// print a block of text using Write()
        $pdf->SetFont('majalla', '', 18, '', false);
        $pdf->Cell(190, 55, $barCode, 0, 1, 'C');
        $pdf->write1DBarcode($barCode, 'C39', 133, 28, '', 18, 0.4, $style, 'N');
//$pdf->Text(170, 85, $barCode);
        $html = $contents;
        $pdf->writeHTML($html, true, false, true, false, '');


        $pdf->Output('Initial SAD Number.pdf', 'I');
    }

}
