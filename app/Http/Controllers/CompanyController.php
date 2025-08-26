<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\InsuranceCompany;
use App\Models\Template;
use App\Models\Question;
use Illuminate\Support\Facades\DB;
use Haruncpi\LaravelIdGenerator\IdGenerator;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Schema;
use Barryvdh\DomPDF\Facade\Pdf; 
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Http;

use App\Models\FinalReport;
use Symfony\Component\HttpFoundation\Response;

class CompanyController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        $search = $request->input('search', '');

        $company=InsuranceCompany::when(!empty($search), function ($query) use ($search) 
        {
            $query->where(function ($q) use ($search) 
            {
                $q->where('name', 'like', '%' . $search . '%')
                  ->orWhere('email', 'like', '%' . $search . '%')
                  ->orWhere('phone', 'like', '%' . $search . '%');;
            });
        })
        ->orderBy('created_at', 'desc') 
        ->paginate(15);

        return view("dashboard.company.index")->with(['companies'=>$company]);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
    return view("dashboard.company.create");
    }

    
    public function create_question()
    {
    return view("dashboard.company.create_question");
    }

    public function create_templates()
    {
    
    $companies = InsuranceCompany::all(); // Fetch companies
    return view('dashboard.company.create_templates', compact('companies'));
    }

    public function list_templates()
    {
    $templates = Template::with('company')->get();
    return view('dashboard.company.list_templates', compact('templates'));
    }

    public function edit_templates(Template $template)
    {
    // $fields = $template->fields;

    $fields = is_string($template->fields) ? json_decode($template->fields, true) : $template->fields;

    return view('dashboard.company.edit_templates', compact('template', 'fields'));
    }


//     public function update_templates(Request $request, Template $template)
//     {
//     $fields = $request->fields;
//     $template->fields = $fields;
//     $template->save();

//     $existingColumns = Schema::getColumnListing($template->table_name);

//     Schema::table($template->table_name, function (Blueprint $table) use ($fields, $existingColumns, $template) 
//     {
//         foreach ($fields as $field) 
//         {
//             $colName = strtolower(preg_replace('/[^a-zA-Z0-9_]/', '_', $field['name']));
//             $type = $field['type'];

//             if (!in_array($colName, $existingColumns)) 
//             {
//                 self::addColumn($table, $colName, $type);
//             }
//             else
//             {
//                 self::modifyColumn($template->table_name, $colName, $type);
//             }
//         }
//     });

//     return redirect()->route('templates.list_templates')->with('success', 'Template updated successfully.');
// }



        // protected static function addColumn(Blueprint $table, $name, $type)
        // {
        //     switch ($type) {
        //         case 'string':
        //             $table->string($name)->nullable();
        //             break;
        //         case 'integer':
        //             $table->integer($name)->nullable();
        //             break;
        //         case 'boolean':
        //             $table->boolean($name)->default(false);
        //             break;
        //         case 'text':
        //             $table->text($name)->nullable();
        //             break;
        //         case 'json':
        //             $table->json($name)->nullable();
        //             break;
        //         default:
        //             $table->text($name)->nullable();
        //             break;
        //     }
        // }

        // protected static function modifyColumn($tableName, $name, $type)
        // {

        //     Schema::table($tableName, function (Blueprint $table) use ($name, $type) {
        //         switch ($type) {
        //             case 'string':
        //                 $table->string($name)->nullable()->change();
        //                 break;
        //             case 'integer':
        //                 $table->integer($name)->nullable()->change();
        //                 break;
        //             case 'boolean':
        //                 $table->boolean($name)->default(false)->change();
        //                 break;
        //             case 'text':
        //                 $table->text($name)->nullable()->change();
        //                 break;
        //             case 'json':
        //                 $table->json($name)->nullable()->change();
        //                 break;
        //             default:
        //                 $table->text($name)->nullable()->change();
        //                 break;
        //         }
        //     });
        // }


    // public function update_templates(Request $request, Template $template)
    // {
    //     $fields = $request->fields;

    //     $template->fields = json_encode($fields);
    //     $template->save();

    //     Schema::table($template->table_name, function (Blueprint $table) use ($fields, $template) 
    //     {

    //     $existingColumns = Schema::getColumnListing($template->table_name);

    //     foreach ($fields as $field) 
    //     {
    //     $colName = strtolower(preg_replace('/[^a-zA-Z0-9_]/', '_', $field['name']));
    //     $type = $field['type'];

    //     if (!in_array($colName, $existingColumns)) 
    //     {
    //     switch ($type) 
    //     {
    //     case 'string':
    //     $table->string($colName)->nullable();
    //     break;
    //     case 'integer':
    //     $table->integer($colName)->nullable();
    //     break;
    //     case 'boolean':
    //     $table->boolean($colName)->default(false);
    //     break;
    //     case 'text':
    //     $table->text($colName)->nullable();
    //     break;
    //     case 'json':
    //     $table->json($colName)->nullable();
    //     break;
    //     default:
    //     $table->text($colName)->nullable();
    //     break;
    //     }
    //     }
    //     }
    //     });

    //     return redirect()->route('templates.list_templates')->with('success', 'Template updated successfully.');

    // }



    public function update_templates(Request $request)
    {
    $companyId = $request->company_id;
    $fields = $request->fields;

    $template = Template::where('company_id', $companyId)->first();

    if (!$template) 
    {
    return back()->with('error', 'Template for this company not found.');
    }

    $template->fields = $fields; 
    $template->save();

    Schema::table($template->table_name, function (Blueprint $table) use ($fields, $template) 
    {
    $existingColumns = Schema::getColumnListing($template->table_name);

    foreach ($fields as $field) 
    {
        $colName = strtolower(preg_replace('/[^a-zA-Z0-9_]/', '_', $field['name']));
        $type = $field['type'];

        if(!in_array($colName, $existingColumns))
        {
            switch ($type) 
            {
                case 'string':
                    $table->string($colName)->nullable();
                    break;
                case 'integer':
                    $table->integer($colName)->nullable();
                    break;
                case 'boolean':
                    $table->boolean($colName)->default(false);
                    break;
                case 'text':
                    $table->text($colName)->nullable();
                    break;
                case 'json':
                    $table->json($colName)->nullable();
                    break;
                default:
                    $table->text($colName)->nullable();
                    break;
            }
        }
    }
    });

    return redirect()->route('templates.list_templates')->with('success', 'Template updated successfully.');
    }


    public function store_templates(Request $request)
    {
        $companyId = $request->company_id;
        $fields = $request->fields;

        $company = InsuranceCompany::find($companyId);
        if(!$company) 
        {
        return back()->with('error', "Invalid company selected.");
        }

        $companySlug = strtolower(preg_replace('/[^a-zA-Z0-9]+/', '_', $company->name));

        $tableName = "{$companySlug}_{$companyId}_tbl";

        $templatename = 'template_' . $company->name . '_' . time();

        if (Schema::hasTable($tableName)) 
        {
        return back()->with('error', "Table $tableName already exists.");
        }

        Schema::create($tableName, function (Blueprint $table) use ($fields) 
        {
            $table->id();
            $table->unsignedBigInteger('case_id')->nullable();

            foreach ($fields as $field) 
            {
                $name = strtolower(preg_replace('/[^a-zA-Z0-9_]/', '_', $field['name']));
                $type = $field['type'];

                switch ($type) 
                {
                    case 'string':
                        $table->string($name)->nullable();
                        break;
                    case 'integer':
                        $table->integer($name)->nullable();
                        break;
                    case 'boolean':
                        $table->boolean($name)->default(false);
                        break;
                    case 'text':
                        $table->text($name)->nullable();
                        break;
                    case 'json':
                        $table->json($name)->nullable();
                        break;
                    default:
                        $table->text($name)->nullable();
                        break;
                }
            }

            $table->timestamps();
        });

        Template::create([
            'company_id'    =>   $companyId,
            'table_name'    =>   $tableName,
            'template_name' =>   $templatename,
            'fields'        =>   $fields,
        ]);

    return back()->with('success', "Template table `$tableName` created successfully.");
}


    /**
     * Store a newly created resource in storage.
     */

 
    public function getQuestionsByCategory($category)
    {

    $validCategories = [
        'garage_data', 'spot_data', 'owner_data',
        'driver_data', 'accident_person_data'
    ];

    if (!in_array($category, $validCategories)) 
    {
    return response()->json(['error' => 'Invalid category'], 400);
    }

    return Question::where('data_category', $category)->get();
    }

   public function store_question(Request $request)
    {

//     $validated = $request->validate([
//     'question' => 'required|string|max:255',
//     'input_type' => 'required|in:text,textarea,select,file,date',
//     'data_category' => 'required|in:garage_data,spot_data,owner_data,driver_data,accident_person_data',
//     'file_type' => 'required_if:input_type,file|in:image,audio|nullable|string',

//     ]);

//     $question = $validated['question'];
//     $inputType = $validated['input_type'];
//     $dataCategory = $validated['data_category'];
//     $fileType = $request['file_type'];
//     $tableName = $dataCategory;
//     $oldTableName = $tableName . '_old';

//     if (!Schema::hasTable($tableName)) 
//     {
//     Schema::create($tableName, function (Blueprint $table) 
//     {
//         $table->id();
//         $table->timestamps();
//     });
//     }

// if (!Schema::hasTable($oldTableName)) 
//     {
//     Schema::create($oldTableName, function (Blueprint $table) 
//     {
//         $table->id();
//         $table->unsignedBigInteger('assign_work_id')->nullable();
//         $table->unsignedBigInteger('executive_id')->nullable();

//         $table->timestamps();
//     });
// }
//  $columnName = Str::slug($question, '_');

//     foreach ([$tableName, $oldTableName] as $table) 
//     {
//     if (!Schema::hasColumn($table, $columnName)) 
//     {
//     Schema::table($table, function (Blueprint $table) use ($columnName, $inputType) 
//     {
//     switch ($inputType) 
//     {
//     case 'text':
//     $table->string($columnName)->nullable();
//     break;
//     case 'textarea':
//     $table->text($columnName)->nullable();
//     break;
//     case 'select':
//     $table->string($columnName)->nullable();
//     break;
//     case 'file':
//     $table->string($columnName)->nullable();
//     break;
//     case 'date':
//     $table->date($columnName)->nullable();
//     break;
//     }
//     });
//     }
//     }
    
//     do 
//     {
//     $uniqueKey = '#' . strtoupper(Str::random(5)) . rand(10, 99);
//     } 
//     while (Question::where('unique_key', $uniqueKey)->exists());
//     Question::create([
//         'question'          => $question,
//         'input_type'        => $inputType,
//         'data_category'     => $dataCategory,
//         'column_name'       => $columnName,
//         'unique_key'       => $uniqueKey,
//         'file_type'         => $fileType,    
//     ]);


    $validated = $request->validate([
        'question' => 'required|string|max:255',
        'input_type' => 'required|in:text,textarea,select,file,date',
        'data_category' => 'required|in:garage_data,spot_data,owner_data,driver_data,accident_person_data',
        'file_type' => 'required_if:input_type,file|in:image,audio|nullable|string',
    ]);

    $question = $validated['question'];
    $inputType = $validated['input_type'];
    $dataCategory = $validated['data_category'];
    $fileType = $request->file_type ?? null;

    $tableName = $dataCategory;
    $oldTableName = $tableName . '_old';

    // Create new table if it doesn't exist
    if (!Schema::hasTable($tableName)) {
        Schema::create($tableName, function (Blueprint $table) {
            $table->id();
            $table->timestamps();
        });
    }

    if (!Schema::hasTable($oldTableName)) {
        Schema::create($oldTableName, function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('assign_work_id')->nullable();
            $table->unsignedBigInteger('executive_id')->nullable();
            $table->timestamps();
        });
    }

    // Generate a safe column name
    $columnName = Str::slug($question, '_');

    // Add new column to both tables
    foreach ([$tableName, $oldTableName] as $table) {
        if (!Schema::hasColumn($table, $columnName)) {
            Schema::table($table, function (Blueprint $tableBlueprint) use ($columnName, $inputType, $dataCategory) {
                switch ($inputType) {
                    case 'text':
                    case 'select':
                    case 'file':
                        if ($dataCategory === 'accident_person_data') {
                            $tableBlueprint->text($columnName)->nullable(); // prevent row size error
                        } else {
                            $tableBlueprint->string($columnName)->nullable();
                        }
                        break;

                    case 'textarea':
                        $tableBlueprint->text($columnName)->nullable();
                        break;

                    case 'date':
                        $tableBlueprint->date($columnName)->nullable();
                        break;
                }
            });
        }
    }

    // Generate unique key
    do {
        $uniqueKey = '#' . strtoupper(Str::random(5)) . rand(10, 99);
    } while (Question::where('unique_key', $uniqueKey)->exists());

    // Store question
    Question::create([
        'question'      => $question,
        'input_type'    => $inputType,
        'data_category' => $dataCategory,
        'column_name'   => $columnName,
        'unique_key'    => $uniqueKey,
        'file_type'     => $fileType,
    ]);

    // return response()->json(['success' => 'Questionnaire added successfully']);
    
    return response()->json([
    'success' => 'Questionnaire added successfully',
    'redirect_url' => route('questions.index_question') // pass the redirect URL too
    ]);

    }


public function store_questionpdf(Request $request)
{
  
    $validated = $request->validate([
        'question' => 'required|string|max:255',
        'input_type' => 'required|in:text,textarea,select,file,date',
        'data_category' => 'required|in:garage_data,spot_data,owner_data,driver_data',
    ]);

    $questionText = $validated['question'];
    $inputType = $validated['input_type'];
    $dataCategory = $validated['data_category'];

    $tableName = $dataCategory;

    if (!Schema::hasTable($tableName)) 
    {
        Schema::create($tableName, function (Blueprint $table) {
            $table->id();
            $table->timestamps();
        });
    }

    $columnName = Str::slug($questionText, '_');
    if (!Schema::hasColumn($tableName, $columnName)) 
    {
        Schema::table($tableName, function (Blueprint $table) use ($columnName, $inputType) {
            switch ($inputType) {
                case 'text':
                    $table->string($columnName)->nullable();
                    break;
                case 'textarea':
                    $table->text($columnName)->nullable();
                    break;
                case 'select':
                    $table->string($columnName)->nullable();
                    break;
                case 'file':
                    $table->string($columnName)->nullable();
                    break;
                case 'date':
                    $table->date($columnName)->nullable();
                    break;
            }
        });
    }

    $uniqueKey = hash('sha256', $questionText . now() . Str::uuid());

    $newQuestion = Question::create([
        'question' => $questionText,
        'input_type' => $inputType,
        'data_category' => $dataCategory,
        'column_name' => $columnName,
        'unique_key' => $uniqueKey,
    ]);

    $pdfView = 'pdf.question_report_style1';

    switch ($inputType) 
    {
        case 'text':
            $pdfView = 'pdf.question_report_style1';
            break;
        case 'textarea':
            $pdfView = 'pdf.question_report_style2';
            break;
        case 'select':
            $pdfView = 'pdf.question_report_style3';
            break;
        case 'file':
            $pdfView = 'pdf.question_report_style4';
            break;
        case 'date':
            $pdfView = 'pdf.question_report_style5';
            break;
    }

    // Generate PDF from chosen view and pass question data
    $pdf = Pdf::loadView($pdfView, ['question' => $newQuestion]);

    // $fileName = Str::slug($questionText) . '_' . now()->format('Ymd_His') . '.pdf';
    // return $pdf->download($fileName);

    $fileName = Str::slug($questionText) . '_' . now()->format('Ymd_His') . '.pdf';
    $pdfPath = 'pdfs/' . $fileName;
    Storage::disk('public')->put($pdfPath, $pdf->output());

    return response()->download(storage_path("app/public/{$pdfPath}"));

}

    public function index_question(Request $request)
    {
    $search = $request->input('search', '');

    $questions = Question::when(!empty($search), function ($query) use ($search) {
    $query->where(function ($q) use ($search) {
    $q->where('question', 'like', '%' . $search . '%')
    ->orWhere('input_type', 'like', '%' . $search . '%')
    ->orWhere('data_category', 'like', '%' . $search . '%');
    });
    })
    ->orderBy('created_at', 'desc')
    ->paginate(15);

    return view('dashboard.company.index_question', compact('questions', 'search'));
    }

    public function edit_question($id)
    {
    $question = Question::findOrFail($id);
    return view('dashboard.company.edit_question', compact('question'));
    }

    public function update_question(Request $request, $id)
    {
    $validated = $request->validate([
    'question' => 'required|string|max:255',
    'input_type' => 'required|in:text,textarea,select,file,date',
    'data_category' => 'required|in:garage_data,spot_data,owner_data,driver_data',
    ]);

    $question = Question::findOrFail($id);

    $oldColumn = $question->column_name;
    $newColumn = Str::slug($validated['question'], '_');
    $tableName = $validated['data_category'];

    if ($oldColumn !== $newColumn && Schema::hasColumn($tableName, $oldColumn)) {
    // Get the column type and nullability
    $column = DB::selectOne("
    SELECT COLUMN_TYPE, IS_NULLABLE, COLUMN_DEFAULT
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = ? AND COLUMN_NAME = ? AND TABLE_SCHEMA = DATABASE()
    ", [$tableName, $oldColumn]);

    if ($column) {
    $columnType = $column->COLUMN_TYPE;
    $nullable = $column->IS_NULLABLE === 'YES' ? 'NULL' : 'NOT NULL';
    $default = $column->COLUMN_DEFAULT !== null ? "DEFAULT '" . addslashes($column->COLUMN_DEFAULT) . "'" : '';

    // Use raw SQL with full column definition
    DB::statement("
        ALTER TABLE `$tableName` CHANGE `$oldColumn` `$newColumn` $columnType $nullable $default
    ");
    } else {
    // Fail gracefully
    return back()->with('error', 'Failed to retrieve column info for renaming.');
    }
    }

    // Continue updating question record
    $question->update([
    'question' => $validated['question'],
    'input_type' => $validated['input_type'],
    'data_category' => $validated['data_category'],
    'column_name' => $newColumn,
    ]);
   return response()->json([
    'success' => 'Questionnaire updated successfully',
    'redirect_url' => route('questions.index_question') // pass the redirect URL too
]);


    // return redirect()->route('questions.index_question')->with('success', 'Questionnaire updated successfully.');

    }

    public function destroy_question($id)
    {
    $question = Question::findOrFail($id);
    $tableName = $question->data_category;
    $column = $question->column_name;

    if (Schema::hasColumn($tableName, $column)) {
    Schema::table($tableName, function (Blueprint $table) use ($column) {
        $table->dropColumn($column);
    });
    }

    $question->delete();

    return redirect()->route('questions.index_question')->with('success', 'Questionnaire deleted successfully.');
    }


    public function store(Request $request)
    {

      $request->validate([
        'name'            => 'required|string|max:255',
        'contact_person'  => 'required|string|max:255',
        'phone'           => 'required|unique:insurance_companies,phone',
        'email'           => 'required|email|unique:insurance_companies,email',
        'address'         => 'required|string',
        'template'        => 'required',
        ]);

        $finalQuestionnaire = [];
        $selectedTabs = [];

        $selectedQuestions = $request->input('selected_questions', []);

        if (is_array($selectedQuestions)) 
        {
        foreach ($selectedQuestions as $tab => $fields) 
        {
        if (!empty($fields)) 
        {
        $selectedTabs[] = $tab;

        foreach ($fields as $field) 
        {
        $type = $request->input("question_types.$tab.$field", 'select');

        $fieldData = [
            'name'     => $field,
            'label'    => ucwords(str_replace('_', ' ', $field)),
            'type'     => $type,
            'required' => false,
        ];

        if ($type === 'file') 
        {
            $fileType = $request->input("file_types.$tab.$field", null);
            $fieldData['file_type'] = $fileType;
        }

        if ($type === 'select') 
        {
            $fieldData['options'] = [
                ['label' => 'Yes', 'value' => 1],
                ['label' => 'No', 'value' => 0],
                ['label' => 'Other', 'value' => 2],
            ];
        }

        $finalQuestionnaire[$tab][$field] = $fieldData;
        }
        }
        }
        }

        $company = InsuranceCompany::create([
        'name'            => $request->name,
        'contact_person'  => $request->contact_person,
        'phone'           => $request->phone,
        'email'           => $request->email,
        'address'         => $request->address,
        'template'        => $request->template,
        'status'          => 1,
        'create_by'       => Auth::id(),
        'update_by'       => Auth::id(),
        'selected_tabs'   => json_encode(array_keys($request->input('selected_questions', []))),
        'questionnaires'  => json_encode($finalQuestionnaire),
        ]);

        // return response()->json(['success' => 'Company added and table "' . $tableName . '" created successfully.']);

        // return response()->json(['success' => 'Company added successfully']);
          return response()->json([
        'success' => 'Company added successfully',
        'redirect_url' => route('company.list') // pass the redirect URL too
        ]);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        // $company = InsuranceCompany::where('id', $id)->first(); 
        // return view('dashboard.company.edit')->with(['company'=> $company]);

       

   $company = InsuranceCompany::findOrFail($id);
    $selectedTabs = $company->selected_tabs ? json_decode($company->selected_tabs, true) : [];
    $questionnaires = $company->questionnaires ? json_decode($company->questionnaires, true) : [];

        return view('dashboard.company.edit')->with([
        'company'            => $company,
        'selectedTabs'       => $selectedTabs,
        'questionnaires'     => $questionnaires,
        ]);
    }

    /**
     * Update the specified resource in storage.
     */



    public function update(Request $request)
    {
        // $request->validate([
        //     "id"=> "required",
        //     "name" => "required",
        //     "contact_person" => "required",
        //     "email" => "required",
        //     "phone" => "required",
        //     "address" => "required",
        //     'template'=>'required',
        //     "status" => "required",
        // ]);

        // InsuranceCompany::where("id", $request->id)->update([
        //     "name"=>$request->name,
        //     "contact_person"=>$request->contact_person,
        //     "email"=>$request->email,
        //     "phone"=>$request->phone,
        //     "address"=>$request->address,
        //     'template'=>$request->template,
        //     "status"=>$request->status,
        // ]);

        // return response()->json(['success' => 'Company update successfully']);



         $request->validate([
        "id"             => "required",
        "name"           => "required",
        "contact_person" => "required",
        "email"          => "required",
        "phone"          => "required",
        "address"        => "required",
        "template"       => "required",
        "status"         => "required",
    ]);

    $company = InsuranceCompany::findOrFail($request->id);

    // Handle dynamic tab/questionnaire data
   $finalQuestionnaire = [];

if ($request->has('selected_questions') && is_array($request->selected_questions)) {
    foreach ($request->input('selected_questions') as $tab => $fields) {
        foreach ($fields as $field) {
            $type = $request->input("question_types.$tab.$field", 'select');

            $fieldData = [
                'name'     => $field,
                'label'    => ucwords(str_replace('_', ' ', $field)),
                'type'     => $type,
                'required' => false,
            ];

            // Handle file type
            if ($type === 'file') {
                $fileType = $request->input("file_types.$tab.$field", null);
                $fieldData['file_type'] = $fileType;
            }

            // Handle select type with Yes/No options
            if ($type === 'select') {
                $fieldData['options'] = [
                    ['label' => 'Yes', 'value' => 1],
                    ['label' => 'No', 'value' => 0],
                    ['label' => 'Other', 'value' => 2],
                    
                ];
            }

            $finalQuestionnaire[$tab][$field] = $fieldData;
        }
    }
}

    // Update the company with new values
    $company->update([
        "name"            => $request->name,
        "contact_person"  => $request->contact_person,
        "email"           => $request->email,
        "phone"           => $request->phone,
        "address"         => $request->address,
        "template"        => $request->template,
        "status"          => $request->status,
        "update_by"       => auth()->id(),
        "selected_tabs"   => json_encode(array_keys($request->input('selected_questions', []))),
        "questionnaires"  => json_encode($finalQuestionnaire),
    ]);

    // return response()->json(['success' => 'Company updated successfully']);

     return response()->json([
        'success' => 'Company updated successfully',
        'redirect_url' => route('company.list') // pass the redirect URL too
        ]);

    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
    
   
    // public function previewFinalPdf(Request $request)
    // {
    //     try {
    //     $reportId = $request->report_id;

    //     $finalReport = FinalReport::where('id', $reportId)->firstOrFail();
    //     $templateNo = $finalReport->template;

    //     switch ($templateNo) {
    //         case 1:
    //             $pdf = PDF::loadView('dashboard.pdf.pdf1', compact('finalReport'));
    //             break;
    //         case 2:
    //             $pdf = PDF::loadView('dashboard.pdf.pdf2', compact('finalReport'));
    //             break;
    //         case 3:
    //             $pdf = PDF::loadView('dashboard.pdf.pdf3', compact('finalReport'));
    //             break;
    //         case 4:
    //             $pdf = PDF::loadView('dashboard.pdf.pdf4', compact('finalReport'));
    //             break;
    //         case 5:
    //             $pdf = PDF::loadView('dashboard.pdf.pdf5', compact('finalReport'));
    //             break;
    //         case 6:
    //             $pdf = PDF::loadView('dashboard.pdf.pdf6', compact('finalReport'));
    //             break;
    //         case 7:
    //             $pdf = PDF::loadView('dashboard.pdf.pdf7', compact('finalReport'));
    //             break;
    //         case 8:
    //             $pdf = PDF::loadView('dashboard.pdf.pdf8', compact('finalReport'));
    //             break;
    //         default:
    //             $pdf = PDF::loadView('dashboard.pdf.pdf', compact('finalReport'));
    //     }

    //     return response()->stream(function () use ($pdf) 
    //     {
    //         echo $pdf->output();
    //     }, 200, [
    //         "Content-Type" => "application/pdf",
    //         "Content-Disposition" => "inline; filename=insurance_preview.pdf", // 👈 Changed to inline
    //     ]);

    // } 
    //     catch (Exception $e) 
    //     {
    //     \Log::error('Error generating PDF preview: ' . $e->getMessage());
    //     return abort(500, 'Error generating PDF.');
    //     }
    // }


    // public function fetchAndInsert()
    // {

    // $response = Http::get('https://example.com/api/questionnaire-data');

    // if ($response->successful()) 
    // {
    // $payload = $response->json();

    // $tableMap = [
    //     'garage' => 'garage_data',
    //     'spot' => 'spot_data',
    //     'driver' => 'driver_data',
    //     'meeting' => 'owner_data',
    //     'accident' => 'accident_person_data',
    // ];

   


    // foreach ($payload as $item) 
    // {
    //     $work = $item['work'];
    //     $caseId = $item['case_id'];
    //     $data = $item['data'];

    //     $table = $tableMap[$work] ?? null;

    //     if (!$table || !is_array($data)) 
    //     {
    //     continue;
    //     }

    //     $data['assign_work_id'] = $caseId;

    //     $existing = DB::table($table)->where('assign_work_id', $caseId)->first();

    //     if ($existing) 
    //     {

    //     $existingData = (array) $existing;
    //     unset($existingData['id'], $existingData['created_at'], $existingData['updated_at']);
    //     $diff = array_diff_assoc($data, $existingData);

    //     if (!empty($diff)) 
    //     {
    //     DB::table($table)->where('assign_work_id', $caseId)->update($data);
    //     }

    //     } 

    //     else
    //     {
    //     DB::table($table)->insert($data);
    //     }
    // }

    // return response()->json(['status' => 'success', 'source' => 'external API']);
    // }

    // return response()->json(['error' => 'Failed to fetch data'], 500);
    // }



}
