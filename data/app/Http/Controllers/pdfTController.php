<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
class MYPDF extends \TCPDF {

    //Page header
    public function Header() {
        // Logo
        $image_file = base_path('../files/img/logo.png');
        $this->Image($image_file, 70, 5, 55, '', 'png', '', 'N', false, 300, '', false, false, 0, false, false, false);
        $this->SetFont('majalla', 'B', 20);
        // Title
        //$this->Cell(0, 15, 'test', 0, false, 'R', 0, '', 0, false, 'M', 'M');
        $txt = 'ميعاد استلام المستندات';
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
class pdfTController extends Controller {

    function index($id) {
        $application = \App\Models\Applications::find($id);
        $username = \App\Models\User::find($application->created_by)->username;
        $barCode = $application->did_num;
        $date = new \Carbon\Carbon($application->created_at);
        $date->addDay(2);
        $date =  $date->format('Y M d');
        //dd($date);
       // return view('pdfT', ['date' => $date]);
        $contents = view('pdfT', ['date' => $date , 'username'=>$username, 'application'=>$application])->render();
        //var_dump($contents);
        $pdf = new MYPDF(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);

// set document information

        $pdf->SetCreator(PDF_CREATOR);
        $pdf->SetAuthor('EgyTrade');
        $pdf->SetTitle('Receiving Date');
        $pdf->SetSubject('Receiving Date');
        $pdf->SetKeywords('PDF, guide');

        // set default header data
//        $pdf->SetHeaderData(PDF_HEADER_LOGO, PDF_HEADER_LOGO_WIDTH, PDF_HEADER_TITLE . ' 006', PDF_HEADER_STRING);
        // set header and footer fonts
        $pdf->setHeaderFont(Array(PDF_FONT_NAME_MAIN, '', PDF_FONT_SIZE_MAIN));
        $pdf->setFooterFont(Array(PDF_FONT_NAME_DATA, '', PDF_FONT_SIZE_DATA));
        $pdf->setRTL(true);
        // set default monospaced font
        $pdf->SetDefaultMonospacedFont(PDF_FONT_MONOSPACED);

        // set margins
       // $pdf->SetMargins(PDF_MARGIN_LEFT, PDF_MARGIN_TOP, PDF_MARGIN_RIGHT);
        //$pdf->SetHeaderMargin(PDF_MARGIN_HEADER);
        //$pdf->SetFooterMargin(PDF_MARGIN_FOOTER);

        // set auto page breaks
$style = array(
    'border' => 2,
    'vpadding' => 'auto',
    'hpadding' => 'auto',
    'fgcolor' => array(0,0,0),
    'bgcolor' => false, //array(255,255,255)
    'module_width' => 1, // width of a single module in points
    'module_height' => 1 // height of a single module in points
);
 
        $pdf->SetAutoPageBreak(TRUE, 25);
        $pdf->SetMargins(PDF_MARGIN_LEFT, 25,PDF_MARGIN_RIGHT);

        // set image scale factor
        $pdf->setImageScale(PDF_IMAGE_SCALE_RATIO);

        $pdf->SetFont('majalla', '', 14, '', false);
        $pdf->AddPage('P','A4');
//$pdf->write1DBarcode($barCode, 'C39', 80, 30, 50, 15, $style, 'N');
        $image_file = 'F:\logo.png';
        //$pdf->Image($image_file, 70, 22, 55, '', 'png', '', 'N', false, 300, '', false, false, 0, false, false, false);
        $pdf->setImageScale(PDF_IMAGE_SCALE_RATIO);
$pdf->SetFont('majalla', '', 18, '', false);
          $pdf->Cell(183, 55, $barCode, 0, 1, 'C');
        $pdf->write1DBarcode($barCode, 'C39', 133, 28, '', 18, 0.4, $style, 'N');
//$pdf->Text(170, 85, $barCode);
        $html = $contents;
        $pdf->writeHTML($html, true, false, true, false, '');


        $pdf->Output('Receiving Date.pdf', 'I');
    }

}
