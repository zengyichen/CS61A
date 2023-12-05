def link_list(head, rest)
    assert(is_link(rest), "rest is not a list.")
    return [head, rest]

def is_link(s)
    if s == []:
        return True
    return is_link(rest(s))

def head(s)
    assert(is_link)
