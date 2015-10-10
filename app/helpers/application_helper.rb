module ApplicationHelper
  def bootstrap_class_for (flash_type)
    { success: 'alert-success', error: 'alert-danger', alert: 'alert-warning', notice: 'alert-info' }[flash_type.to_sym] || flash_type.to_s
  end

  def flash_messages(opts = {})
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)} alert-dismissible", role: 'alert') do
               concat(content_tag(:button, class: 'close', data: { dismiss: 'alert' }) do
                        concat content_tag(:span, '&times;'.html_safe, 'aria-hidden' => true)
                        concat content_tag(:span, 'Close', class: 'sr-only')
                      end)
               concat message
             end)
    end
    nil
  end

  def get_role(user)
    roles = Role.where(:id=>user.roles)
    content = ""
    for role in roles
      content << '<font color="#dc143c"><b>'+ role.name.upcase+'</b></font> '
      content <<  "<br/>"
    end
    content.html_safe
  end

  def business_total
    Transaction.where('amount < ?', 0).sum(:amount).abs
  end

  def month_total
    Transaction.where('amount < ? AND MONTH(transaction_date) = ?', 0, Time.now.month).sum(:amount).abs
  end

  def get_csp_name(tr)
    accounts = Account.where(:csp_code => tr.csp_code).first
    content = ""
    return "N.A".html_safe if accounts.blank?
    content << accounts.name.to_s.titleize
    content.html_safe
  end

  def get_csp_account_number(tr)
    accounts = Account.where(:csp_code => tr.csp_code).first
    return "N.A".html_safe if accounts.blank?
    content = ""
    content << accounts.account_number.to_s
    content.html_safe
  end

  def get_csp_branch(tr)
    accounts = Account.where(:csp_code => tr.csp_code).first
    return "N.A".html_safe if accounts.blank?
    content =""
    content << accounts.bank_branch
    content.html_safe
  end
  def get_csp_branch_code(tr)
    accounts = Account.where(:csp_code => tr.csp_code).first
    return "N.A".html_safe if accounts.blank?
    content =""
    content << accounts.bank_code
    content.html_safe
  end
end
