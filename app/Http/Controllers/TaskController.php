<?php

namespace App\Http\Controllers;

use App\Models\Task;
use App\Events\TaskCreated;
use App\Models\Project;
use Illuminate\Http\Request;

class TaskController extends Controller
{
    public function index($project)
    {
        return Task::where('project_id', $project)->pluck('name');
    }
    public function store(Request $request)
    {
        $task = Task::create([
            'name' => $request->input('name'),
            'project_id' => $request->input('project_id'),
        ]);

        event(new TaskCreated($task));
    }
}
