Function Await {
    Param(
        $AsyncTask,
        $ResultType
    )

    $getAwaiterBaseMethod.
        MakeGenericMethod($ResultType).
        Invoke($null, @($AsyncTask)).
        GetResult()
}
