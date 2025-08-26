<?php

namespace App\Http\Controllers;

use App\Models\Field;
use Illuminate\Http\Request;

class FieldAddingController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $fields = Field::paginate(10);
        return view('dashboard.fields.index',compact('fields'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
       return view('dashboard.fields.create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',   
            'type' => 'required|string|max:255',   
            'validation.*' => 'required|string', 
        ]);

      

        $fieldAddition = Field::create([
            'name' => ucfirst($request->input('name')),
            'type' => $request->input('type'),
            'validation' => $request->validation
        ]);

        return redirect()->route('field-addition.index')->with('success', 'Field added successfully.'); 
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
       
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        $fieldList=Field::where('id',$id)->first();
        return view('dashboard.fields.edit',compact('fieldList'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $request->validate([
            'name' => 'required|string|max:255',   
            'type' => 'required|string|max:255',   
            'validation.*' => 'required|string', 
        ]);
        
        $fieldUpdate=Field::findOrFail($id);
        $fieldUpdate->name=$request->name;
        $fieldUpdate->type=$request->type;
        $fieldUpdate->validation=$request->validation;
        $fieldUpdate->update();
        return redirect()->route('field-addition.index')->with('success', 'Field edited successfully.');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        Field::find($id)->delete();
    }
}
