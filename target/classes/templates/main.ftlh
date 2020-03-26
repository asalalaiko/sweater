<#import "parts/common.ftlh" as c>
<#import "parts/login.ftlh" as l>

<@c.page>
    <div>
        <@l.logout />
        <span><a href="/user">User list</a></span>
    </div>
    <div>
        <form method="post">
            <input type="text" name="text" placeholder="Введите сообщение">
            <input type="text" name="tag" placeholder="Тэг">
            <input type="hidden" name="_csrf" value="${_csrf.token}" />
            <button type="submit">Отправить</button>
        </form>
    </div>
    <div>Список сообщений</div>
    <form method="get" action="/main">
        <input type="text" name="filter" value="${filter}">
        <button type="submit">Найти</button>
    </form>
    <table>
        <tr>
            <td><b>id</b></td>
            <td><span>text</span></td>
            <td><i>tag</i></td>
            <td><strong>authorName</strong></td>
        </tr>
        <#list messages as message>
            <tr>
                <div>
                    <td><b>${message.id}</b></td>
                    <td><span>${message.text}</span></td>
                    <td><i>${message.tag}</i></td>
                    <td><strong>${message.authorName}</strong></td>
                </div>
            </tr>
        <#else> No messages
        </#list>
    </table>
</@c.page>