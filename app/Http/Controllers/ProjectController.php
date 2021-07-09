<?php

namespace App\Http\Controllers;

use App\Models\Project;
use Illuminate\Http\Request;

class ProjectController extends Controller
{
    public function show(Project $project) {
        $project->load('tasks');

        return view('projects.show', compact('project'));
    }
}
