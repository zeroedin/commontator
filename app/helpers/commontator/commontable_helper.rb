module Commontator
  module CommontableHelper
    def commontable_link(commontable, commontator)
      render(:partial => 'commontator/commontables/thread',
             :locals => {:commontable => commontable,
                         :commontator => commontator}).html_safe
    end
  end
end