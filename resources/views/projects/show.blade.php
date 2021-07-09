@extends('layouts.app')

@section('title', $project->name . ' Project')

@section('style')
    
@endsection

@section('script')
<script>
    window.App = {!! json_encode(auth()->user()) !!}
</script>
@endsection

@section('content')

@include('shared.message')
@include('shared.errors')

<div class="container">
    <div class="text-right font-weight-bold mb-2">
        {{ $project->name }}
    </div>
    <task-component :project="{{ $project }}"></task-component>
</div>
@endsection