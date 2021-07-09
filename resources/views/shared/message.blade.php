@if (session()->has('message'))
<div class="alert alert-{{ session('message')['type'] }}">
    {!! session('message')['body'] !!}
</div>
@endif