if Rho::System.isRhoSimulator || System.get_property('platform') == 'WINDOWS' || System.get_property('platform') == 'WINDOWS_DESKTOP'  || System.get_property('platform') == 'ANDROID'  || System.get_property('platform') == 'APPLE'


module Rho
class NativeTabbar

  class << self
 
  alias :create_orig create
  

  def convert_hash(opt)
          if opt != nil
            res_opt = {}
            opt.each do |key,value|
              if value == true
                value = 'true'
              end
              if value == false
                value = 'false'
              end
              res_opt[key.to_s] = value.to_s
            end 
            return res_opt
          end
          return nil
  end


  def create(params, options = {})
  
    if (params.is_a?(Hash))
        buttons = params[:tabs]
    elsif params.is_a?(Array)
        buttons = params        
        params = options
    else
        raise ArgumentError, 'invalid argument: first parameter should be Hash or Array.'
    end

    if ( buttons && buttons.is_a?(Array))    
        buttons.each do |btn|
            btn[:coloredIcon] = btn[:colored_icon] if btn && btn[:colored_icon]
            btn[:selectedColor] = btn[:selected_color] if btn && btn[:selected_color]
            btn[:backgroundColor] = btn[:web_bkg_color] if btn && btn[:web_bkg_color]
            btn[:useCurrentViewForTab] = btn[:use_current_view_for_tab] if btn && btn[:use_current_view_for_tab]
            
            params[:backgroundColor] =btn[:background_color] if btn && btn[:background_color]
                        
        end
    end

    if ( buttons && buttons.is_a?(Array) && (System.get_property('platform') == 'ANDROID') )  
        nb = []
        buttons.each do |btn|
           nb << convert_hash(btn)
        end
        buttons = nb
    end




    params[:backgroundColor] = params[:background_color] if params[:background_color]
    
    if System.get_property('platform') == 'ANDROID'
          params = convert_hash(params)
    end	

    if params[:on_change_tab_callback] && params[:on_change_tab_callback].length() > 0
        create_orig( buttons, params, params[:on_change_tab_callback] )
    else
        create_orig( buttons, params )
    end    
    
  end
  end #self
end
end 
 
end