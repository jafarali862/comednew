<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use PDF;
use App\Models\User;

class PDFController extends Controller
{
    public function generatePDF()
{
    // Retrieve all users
    $users = User::all();
    $data = ['title' => 'User List', 'users' => $users];
    
    $pdf = PDF::loadView('pdf.document', $data);
    return $pdf->stream('users.pdf');
}
}
