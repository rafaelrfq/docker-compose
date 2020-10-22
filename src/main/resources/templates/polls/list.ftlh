<#include "../base.ftlh">

<#macro page_body>
    <br><br>
    <h2 class="text-center">List of Polls</h2><br>
    <div class="container">
        <div>
            <a class="btn btn-outline-primary" href="/polls/create">New Poll</a>
        </div>

        <br>
        <table class="table table-striped">
            <thead class="thead-dark">
            <tr>
                <th scope="col">Date</th>
                <th scope="col">Name</th>
                <th scope="col">Total Score</th>
                <th scope="col">Comment</th>
                <th scope="col">Options</th>
            </tr>
            </thead>
            <tbody>
            <#if polls??>
                <#list polls as poll>
                    <tr>
                        <th scope="row">${poll.dateCreated}</th>
                        <td>${poll.user.name}</td>
                        <td>${poll.valueQuestion1?c}</td>
                        <td>${poll.valueQuestion4}</td>
                        <td>
                            <a class="btn btn-danger" href="/polls/delete=${poll.id}">Delete Poll</a>
                        </td>
                    </tr>
                </#list>
            <#else>
                <tr>
                    <td colspan="5">No poll data was found</td>
                </tr>
            </#if>
            </tbody>
        </table>
    </div>
</#macro>

<@display_page/>